import 'package:flutter/material.dart';
import 'package:statisfuel/global/theme/extensions/tv_button_theme.dart';

class TVButton extends StatelessWidget {
  const TVButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor,
    this.shadowColor,
    this.shadowBlurRadius = 10,
    this.shadowSpreadRadius = 0,
    this.shadowOffset = const Offset(0, 4),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.padding,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? overlayColor;
  final Color? shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tvTheme = Theme.of(context).extension<TVButtonThemeData>();

    final effectiveBackgroundColor =
        backgroundColor ?? tvTheme?.backgroundColor ?? colorScheme.surface;
    final effectiveForegroundColor =
        foregroundColor ?? tvTheme?.foregroundColor ?? colorScheme.onSurface;
    final effectiveOverlayColor = overlayColor ?? tvTheme?.overlayColor;
    final effectiveShadowColor = shadowColor ??
        tvTheme?.shadowColor ??
        colorScheme.primary.withValues(alpha: 0.16);
    final effectiveBlur = shadowBlurRadius == 10
        ? (tvTheme?.shadowBlurRadius ?? shadowBlurRadius)
        : shadowBlurRadius;
    final effectiveSpread = shadowSpreadRadius == 0
        ? (tvTheme?.shadowSpreadRadius ?? 0)
        : shadowSpreadRadius;
    final effectiveOffset = shadowOffset == const Offset(0, 4)
        ? (tvTheme?.shadowOffset ?? shadowOffset)
        : shadowOffset;
    final effectiveBorderRadius = borderRadius is BorderRadius
        ? (tvTheme?.borderRadius ?? borderRadius)
        : borderRadius;
    final effectivePadding = padding ?? tvTheme?.padding;

    final effectiveStyle = (style ??
        TextButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          foregroundColor: effectiveForegroundColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: effectivePadding,
          shape: RoundedRectangleBorder(
            borderRadius: effectiveBorderRadius as BorderRadius,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: effectiveOverlayColor,
        ));

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: effectiveBorderRadius,
        boxShadow: [
          BoxShadow(
            color: effectiveShadowColor,
            blurRadius: effectiveBlur,
            spreadRadius: effectiveSpread,
            offset: effectiveOffset,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: effectiveStyle,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        statesController: statesController,
        child: child,
      ),
    );
  }
}
