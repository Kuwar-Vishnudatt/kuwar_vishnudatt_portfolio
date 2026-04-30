import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central theme configuration for the cyberpunk portfolio.
class AppTheme {
  // ─── Core Palette ─────────────────────────────────────────────────────────
  static const Color bgDark     = Color(0xFF050A14);
  static const Color bgCard     = Color(0xFF0A1628);
  static const Color bgGlass    = Color(0x1A00D4FF);

  static const Color neonCyan    = Color(0xFF00D4FF);
  static const Color neonPurple  = Color(0xFFBF00FF);
  static const Color neonMagenta = Color(0xFFFF006E);
  static const Color neonBlue    = Color(0xFF0066FF);
  static const Color neonGreen   = Color(0xFF00FF88);

  static const Color textPrimary   = Color(0xFFE8F4FD);
  static const Color textSecondary = Color(0xFF7A9BB5);
  static const Color textDim       = Color(0xFF3A5A70);

  // ─── Gradients ────────────────────────────────────────────────────────────
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x2200D4FF), Color(0x11BF00FF)],
  );

  // ─── Glow Shadows ─────────────────────────────────────────────────────────
  static List<BoxShadow> cyanGlow({double intensity = 1.0}) => [
    BoxShadow(color: neonCyan.withOpacity(0.4 * intensity),    blurRadius: 20 * intensity, spreadRadius: 2 * intensity),
    BoxShadow(color: neonCyan.withOpacity(0.2 * intensity),    blurRadius: 40 * intensity, spreadRadius: 5 * intensity),
  ];
  static List<BoxShadow> purpleGlow({double intensity = 1.0}) => [
    BoxShadow(color: neonPurple.withOpacity(0.4 * intensity),  blurRadius: 20 * intensity, spreadRadius: 2 * intensity),
  ];
  static List<BoxShadow> magentaGlow({double intensity = 1.0}) => [
    BoxShadow(color: neonMagenta.withOpacity(0.4 * intensity), blurRadius: 20 * intensity, spreadRadius: 2 * intensity),
  ];

  // ─── Text Styles ──────────────────────────────────────────────────────────
  static TextStyle get displayLarge  => GoogleFonts.rajdhani(fontSize: 72, fontWeight: FontWeight.w700, color: textPrimary, letterSpacing: 4, height: 1.1);
  static TextStyle get displayMedium => GoogleFonts.rajdhani(fontSize: 48, fontWeight: FontWeight.w700, color: textPrimary, letterSpacing: 3);
  static TextStyle get displaySmall  => GoogleFonts.rajdhani(fontSize: 32, fontWeight: FontWeight.w600, color: textPrimary, letterSpacing: 2);
  static TextStyle get bodyLarge     => GoogleFonts.jetBrainsMono(fontSize: 16, color: textSecondary, height: 1.7, letterSpacing: 0.3);
  static TextStyle get bodyMedium    => GoogleFonts.jetBrainsMono(fontSize: 14, color: textSecondary, height: 1.6);
  static TextStyle get labelStyle    => GoogleFonts.jetBrainsMono(fontSize: 12, color: neonCyan, letterSpacing: 2, fontWeight: FontWeight.w500);
  static TextStyle get chipStyle     => GoogleFonts.jetBrainsMono(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.5);

  // ─── ThemeData ────────────────────────────────────────────────────────────
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bgDark,
    textTheme: GoogleFonts.jetBrainsMonoTextTheme(ThemeData.dark().textTheme),
    colorScheme: const ColorScheme.dark(
      primary: neonCyan,
      secondary: neonPurple,
      surface: bgCard,
      background: bgDark,
    ),
  );
}