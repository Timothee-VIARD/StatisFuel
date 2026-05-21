import 'package:flutter/material.dart';

@immutable
class TVCardThemeData extends ThemeExtension<TVCardThemeData> {
  const TVCardThemeData({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.shadowColor,
    required this.shadowBlurRadius,
    required this.shadowSpreadRadius,
    required this.shadowOffset,
    required this.borderRadius,
    required this.padding,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  TVCardThemeData copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? shadowColor,
    double? shadowBlurRadius,
    double? shadowSpreadRadius,
    Offset? shadowOffset,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return TVCardThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  @override
  TVCardThemeData lerp(
    ThemeExtension<TVCardThemeData>? other,
    double t,
  ) {
    if (other is! TVCardThemeData) {
      return this;
    }

    return TVCardThemeData(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t) ??
          foregroundColor,
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
