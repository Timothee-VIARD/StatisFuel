import 'package:flutter/material.dart';
import 'package:statisfuel/global/theme/extensions/tv_button_theme.dart';
import 'package:statisfuel/theme/app_theme_config.dart';

ThemeData getAppTheme(
  AppColorScheme colors, {
  required Brightness brightness,
}) {
  final colorScheme = ColorScheme(
    brightness: brightness,
    primary: colors.primary,
    onPrimary: colors.onPrimary,
    secondary: colors.secondary,
    onSecondary: colors.onSecondary,
    error: colors.error,
    onError: colors.onError,
    surface: colors.surface,
    onSurface: colors.onSurface,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colors.surface,
    canvasColor: colors.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      elevation: 0,
      centerTitle: false,
    ),
    dividerTheme: DividerThemeData(color: colors.border, thickness: 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colors.onSurface,
        backgroundColor: colors.surface,
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    cardTheme: CardThemeData(
      color: colors.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 5,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colors.secondary,
      selectedItemColor: colors.onSecondary,
      unselectedItemColor: colors.onSecondaryLight,
    ),
    extensions: <ThemeExtension<dynamic>>[
      TVButtonThemeData(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        overlayColor: colors.primary.withValues(alpha: 0.12),
        shadowColor: colors.primary.withValues(alpha: 0.12),
        shadowBlurRadius: 2,
        shadowSpreadRadius: 2,
        shadowOffset: const Offset(0, 2),
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ],
  );
}

final ThemeData appTheme = getAppTheme(
  AppColorScheme.light(),
  brightness: Brightness.light,
);
