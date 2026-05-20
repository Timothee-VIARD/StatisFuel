import 'package:equatable/equatable.dart';

import '../../../theme/app_theme_config.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.mode});

  factory ThemeState.initial() {
    return const ThemeState(mode: AppThemeMode.system);
  }

  final AppThemeMode mode;

  ThemeState copyWith({AppThemeMode? mode}) {
    return ThemeState(mode: mode ?? this.mode);
  }

  @override
  List<Object> get props => [mode];
}
