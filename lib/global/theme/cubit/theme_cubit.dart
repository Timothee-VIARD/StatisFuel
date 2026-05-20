import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../theme/app_theme_config.dart';
import '../../../theme/theme_builder.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial()) {
    _loadThemeMode();
  }

  static const String _themeModeKey = 'theme_mode';

  Future<void> _loadThemeMode() async {
    final preferences = await SharedPreferences.getInstance();
    final storedValue = preferences.getString(_themeModeKey);
    final selectedMode = ThemeBuilder.stringToThemeMode(storedValue);

    if (!isClosed) {
      emit(state.copyWith(mode: selectedMode));
    }
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (state.mode == mode) {
      return;
    }

    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_themeModeKey, mode.storageValue);

    if (!isClosed) {
      emit(state.copyWith(mode: mode));
    }
  }
}
