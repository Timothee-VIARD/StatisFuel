import 'package:flutter/material.dart';
import 'package:statisfuel/theme/app_config.dart';

import 'theme/extensions/tv_card_theme.dart';

class TVCard extends StatelessWidget {
  final Widget content;
  final String Function(BuildContext context)? title;

  const TVCard({super.key, required this.content, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tvTheme = Theme.of(context).extension<TVCardThemeData>();

    final effectiveBackgroundColor =
        tvTheme?.backgroundColor ?? colorScheme.surface;
    final effectiveForegroundColor =
        tvTheme?.foregroundColor ?? colorScheme.onSurface;
    final effectiveShadowColor =
        tvTheme?.shadowColor ?? colorScheme.primary.withValues(alpha: 0.16);
    final effectiveBlur = tvTheme?.shadowBlurRadius;
    final effectiveSpread = tvTheme?.shadowSpreadRadius;
    final effectiveOffset = tvTheme?.shadowOffset;
    final effectiveBorderRadius = tvTheme?.borderRadius;
    final effectivePadding = tvTheme?.padding;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
        border: Border.all(
          color: effectiveForegroundColor.withValues(alpha: 0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: effectiveShadowColor,
            blurRadius: effectiveBlur ?? 10,
            spreadRadius: effectiveSpread ?? 0,
            offset: effectiveOffset ?? const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: effectivePadding ?? const EdgeInsets.all(AppConfig.padding),
        child: Column(
          spacing: AppConfig.spacing * 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(
                title!(context),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: effectiveForegroundColor),
            ),
            content,
          ],
        ),
      ),
    );
  }
}
