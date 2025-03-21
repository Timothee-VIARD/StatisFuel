import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
import 'package:statisfuel/global/snackBar/controllers/state.dart';
import 'package:statisfuel/global/snackBar/custom_snack_bar.dart';
import 'package:statisfuel/main.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // Logger().i('${bloc.runtimeType} $error');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Logger().i('${bloc.runtimeType} $change');

    if (bloc is NotificationCubit && change.nextState is! NotificationInitial) {
      scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
      scaffoldMessengerKey.currentState?.showSnackBar(
        CustomSnackBar(
          title: change.nextState.message.toString(),
          level: change.nextState is NotificationSuccess
              ? SnackBarLevel.success
              : SnackBarLevel.error,
        ).build(scaffoldMessengerKey.currentContext!),
      );
    }
  }
}
