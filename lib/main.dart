import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:statisfuel/global/bloc_observer.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
// theme.dart not required here; ThemeBuilder provides light/dark themes
import 'package:statisfuel/global/theme/cubit/theme_cubit.dart';
import 'package:statisfuel/global/theme/cubit/theme_state.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/main_page.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:statisfuel/theme/app_theme_config.dart';
import 'package:statisfuel/theme/theme_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupRegisteries();
  runApp(TranslationProvider(child: const MyApp()));
}

void setupRegisteries() {
  GetIt.I.registerSingleton<ConsumptionRepository>(ConsumptionRepository());
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = AppBlocObserver();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotificationCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            title: t.app_title,
            theme: ThemeBuilder.getLightTheme(),
            darkTheme: ThemeBuilder.getDarkTheme(),
            themeMode: state.mode.toFlutterThemeMode(),
            home: const MainPage(),
            scaffoldMessengerKey: scaffoldMessengerKey,
          );
        },
      ),
    );
  }
}
