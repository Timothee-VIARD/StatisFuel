import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/theme/app_config.dart';

import '../../../theme/app_theme_config.dart';
import '../../widget.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        final nextMode = _nextMode(state.mode);
        
        return TVButton(
          onPressed: () => context.read<ThemeCubit>().setThemeMode(nextMode),
          padding: const EdgeInsets.symmetric(horizontal: AppConfig.padding * 2, vertical: AppConfig.padding*2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Changer le thème',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tooltip(
                message: state.mode.name.toUpperCase(),
                child: Icon(
                  _iconForMode(state.mode),
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppThemeMode _nextMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.system:
        return AppThemeMode.light;
      case AppThemeMode.light:
        return AppThemeMode.dark;
      case AppThemeMode.dark:
        return AppThemeMode.system;
    }
  }

  IconData _iconForMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.system:
        return Icons.brightness_auto;
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
    }
  }
}
