import 'package:flutter/material.dart';
import 'package:statisfuel/theme/app_theme_config.dart';
import 'theme.dart';

class ThemeBuilder {
  static ThemeData buildTheme(
    AppColorScheme colors, {
    required Brightness brightness,
  }) {
    return getAppTheme(colors, brightness: brightness);
  }

  static ThemeData getThemeForMode(AppThemeMode mode,
      {bool systemIsDark = false,}) {
    final colorScheme =
        AppColorScheme.fromThemeMode(mode, systemIsDark: systemIsDark);
    final brightness = mode == AppThemeMode.dark ||
            (mode == AppThemeMode.system && systemIsDark)
        ? Brightness.dark
        : Brightness.light;

    return buildTheme(colorScheme, brightness: brightness);
  }

  static ThemeData getLightTheme() {
    return buildTheme(AppColorScheme.light(), brightness: Brightness.light);
  }

  static ThemeData getDarkTheme() {
    return buildTheme(AppColorScheme.dark(), brightness: Brightness.dark);
  }

  static String themeModeToString(AppThemeMode mode) {
    return mode.storageValue;
  }

  static AppThemeMode stringToThemeMode(String? value) {
    return appThemeModeFromStorageValue(value);
  }
}
