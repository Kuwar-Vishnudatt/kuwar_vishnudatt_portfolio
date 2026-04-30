import 'package:flutter/material.dart';

/// Responsive breakpoints and layout helpers.
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double horizontalPadding(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < 768) return 20;
    if (w < 1200) return 60;
    return (w - 1100) / 2;
  }

  static double sectionTitleSize(BuildContext context) {
    if (isMobile(context)) return 28;
    if (isTablet(context)) return 36;
    return 48;
  }
}

/// Parse a hex color string like '#00D4FF' or '00D4FF'.
Color hexColor(String hex) {
  final h = hex.replaceAll('#', '');
  return Color(int.parse('FF$h', radix: 16));
}

/// Clamp a scroll offset for parallax calculations.
double clampedOffset(double raw, {double min = 0, double max = 1}) {
  return raw.clamp(min, max);
}
