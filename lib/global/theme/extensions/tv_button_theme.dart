import 'package:flutter/material.dart';

@immutable
class TVButtonThemeData extends ThemeExtension<TVButtonThemeData> {
  const TVButtonThemeData({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.overlayColor,
    required this.shadowColor,
    required this.shadowBlurRadius,
    required this.shadowSpreadRadius,
    required this.shadowOffset,
    required this.borderRadius,
    required this.padding,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color overlayColor;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  TVButtonThemeData copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    Color? shadowColor,
    double? shadowBlurRadius,
    double? shadowSpreadRadius,
    Offset? shadowOffset,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return TVButtonThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  @override
  TVButtonThemeData lerp(
    ThemeExtension<TVButtonThemeData>? other,
    double t,
  ) {
    if (other is! TVButtonThemeData) {
      return this;
    }

    return TVButtonThemeData(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t) ??
          foregroundColor,
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t) ??
          overlayColor,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t) ?? shadowColor,
      shadowBlurRadius:
          lerpDouble(shadowBlurRadius, other.shadowBlurRadius, t) ??
              shadowBlurRadius,
      shadowSpreadRadius:
          lerpDouble(shadowSpreadRadius, other.shadowSpreadRadius, t) ??
              shadowSpreadRadius,
      shadowOffset:
          Offset.lerp(shadowOffset, other.shadowOffset, t) ?? shadowOffset,
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t) ??
              borderRadius,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t) ?? padding,
    );
  }
}

double? lerpDouble(double a, double b, double t) {
  return a + (b - a) * t;
}
