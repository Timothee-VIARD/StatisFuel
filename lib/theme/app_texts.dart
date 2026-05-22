import 'package:flutter/material.dart';
import 'package:statisfuel/theme/app_theme_config.dart';

TextTheme getTextTheme(
  AppColorScheme colors, {
  required Brightness brightness,
}) {
  return ThemeData(brightness: brightness).textTheme.copyWith(
        displaySmall:
            ThemeData(brightness: brightness).textTheme.displaySmall?.copyWith(
                  fontFamily: 'Roboto Medium',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: colors.onSurface,
                ),
        displayMedium:
            ThemeData(brightness: brightness).textTheme.displayMedium?.copyWith(
                  fontFamily: 'Roboto Medium',
                  fontSize: 16,
                  decorationThickness: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
        displayLarge:
            ThemeData(brightness: brightness).textTheme.displayLarge?.copyWith(
                  fontFamily: 'Roboto Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
      );
}
