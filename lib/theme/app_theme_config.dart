import 'package:flutter/material.dart';

import 'app_colors.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

class AppColorScheme {
  final Color blue;
  final Color green;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color onSecondaryLight;
  final Color good;
  final Color onGood;
  final Color alert;
  final Color onAlert;
  final Color error;
  final Color onError;
  final Color surface;
  final Color onSurface;
  final Color border;

  const AppColorScheme({
    required this.blue,
    required this.green,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.onSecondaryLight,
    required this.good,
    required this.onGood,
    required this.alert,
    required this.onAlert,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.border,
  });

  /// Récupère le schéma de couleurs pour le mode de thème spécifié
  factory AppColorScheme.fromThemeMode(
    AppThemeMode mode, {
    bool systemIsDark = false,
  }) {
    if (mode == AppThemeMode.system) {
      return systemIsDark ? AppColorScheme.dark() : AppColorScheme.light();
    }
    return mode == AppThemeMode.dark
        ? AppColorScheme.dark()
        : AppColorScheme.light();
  }

  /// Schéma de couleurs light
  factory AppColorScheme.light() {
    return const AppColorScheme(
      blue: AppColorsLight.blue,
      green: AppColorsLight.green,
      primary: AppColorsLight.primary,
      onPrimary: AppColorsLight.onPrimary,
      secondary: AppColorsLight.secondary,
      onSecondary: AppColorsLight.onSecondary,
      onSecondaryLight: AppColorsLight.onSecondaryLight,
      good: AppColorsLight.good,
      onGood: AppColorsLight.onGood,
      alert: AppColorsLight.alert,
      onAlert: AppColorsLight.onAlert,
      error: AppColorsLight.error,
      onError: AppColorsLight.onError,
      surface: AppColorsLight.surface,
      onSurface: AppColorsLight.onSurface,
      border: AppColorsLight.border,
    );
  }

  /// Schéma de couleurs dark
  factory AppColorScheme.dark() {
    return const AppColorScheme(
      blue: AppColorsDark.blue,
      green: AppColorsDark.green,
      primary: AppColorsDark.primary,
      onPrimary: AppColorsDark.onPrimary,
      secondary: AppColorsDark.secondary,
      onSecondary: AppColorsDark.onSecondary,
      onSecondaryLight: AppColorsDark.onSecondaryLight,
      good: AppColorsDark.good,
      onGood: AppColorsDark.onGood,
      alert: AppColorsDark.alert,
      onAlert: AppColorsDark.onAlert,
      error: AppColorsDark.error,
      onError: AppColorsDark.onError,
      surface: AppColorsDark.surface,
      onSurface: AppColorsDark.onSurface,
      border: AppColorsDark.border,
    );
  }
}

extension AppThemeModeX on AppThemeMode {
  ThemeMode toFlutterThemeMode() {
    switch (this) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }

  String get storageValue => name;
}

AppThemeMode appThemeModeFromStorageValue(String? value) {
  switch (value) {
    case 'light':
      return AppThemeMode.light;
    case 'dark':
      return AppThemeMode.dark;
    case 'system':
    default:
      return AppThemeMode.system;
  }
}
