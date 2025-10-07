import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:statisfuel/global/observers/bloc_observer.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/main_page.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:statisfuel/theme/theme.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: TranslationProvider.of(context).flutterLocale, // use provider
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        title: t.app_title,
        theme: appTheme,
        home: const MainPage(),
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }
}
