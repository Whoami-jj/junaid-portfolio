import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Background + glyph colour pair used for the "app icon" tiles on projects.
class TileTone {
  final Color bg;
  final Color fg;
  const TileTone(this.bg, this.fg);
}

class AppTheme {
  AppTheme._();

  static const List<TileTone> tiles = [
    TileTone(Color(0xFF0B6E6B), Colors.white),
    TileTone(Color(0xFFE5533D), Colors.white),
    TileTone(Color(0xFF2C4A7A), Colors.white),
    TileTone(Color(0xFFE0A526), Color(0xFF2A1F00)),
    TileTone(Color(0xFF7A3B69), Colors.white),
    TileTone(Color(0xFF55742A), Colors.white),
    TileTone(Color(0xFF8A4B1F), Colors.white),
  ];

  static const ColorScheme _light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0B6E6B),
    onPrimary: Colors.white,
    secondary: Color(0xFFE5533D),
    onSecondary: Colors.white,
    error: Color(0xFFB3261E),
    onError: Colors.white,
    surface: Color(0xFFF3F6F4),
    onSurface: Color(0xFF0E2A2B),
    onSurfaceVariant: Color(0xFF4D6665),
    outline: Color(0xFF7F9692),
    outlineVariant: Color(0xFFC9D6D1),
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: Color(0xFFEAEFEC),
    surfaceContainer: Color(0xFFE4EBE8),
    surfaceContainerHigh: Color(0xFFDDE6E2),
    surfaceContainerHighest: Color(0xFFD5E0DB),
  );

  static const ColorScheme _dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF6FE3CC),
    onPrimary: Color(0xFF06201D),
    secondary: Color(0xFFFF7A63),
    onSecondary: Color(0xFF2B0A04),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    surface: Color(0xFF0A1D1E),
    onSurface: Color(0xFFE4F0EC),
    onSurfaceVariant: Color(0xFF92B0AB),
    outline: Color(0xFF5E807B),
    outlineVariant: Color(0xFF254847),
    surfaceContainerLowest: Color(0xFF071516),
    surfaceContainerLow: Color(0xFF102A2B),
    surfaceContainer: Color(0xFF143233),
    surfaceContainerHigh: Color(0xFF183B3C),
    surfaceContainerHighest: Color(0xFF1D4546),
  );

  static ThemeData get lightTheme => _build(_light);
  static ThemeData get darkTheme => _build(_dark);

  static TextTheme _textTheme(ColorScheme c) {
    final body = GoogleFonts.instrumentSansTextTheme();
    TextStyle display(double size, FontWeight w, double h, double ls) =>
        GoogleFonts.bricolageGrotesque(
          fontSize: size,
          fontWeight: w,
          height: h,
          letterSpacing: ls,
        );

    return body
        .copyWith(
          displayLarge: display(56, FontWeight.w800, 0.95, -2),
          displayMedium: display(44, FontWeight.w800, 1.0, -1.5),
          displaySmall: display(36, FontWeight.w700, 1.05, -1),
          headlineMedium: display(30, FontWeight.w700, 1.1, -0.8),
          headlineSmall: display(26, FontWeight.w700, 1.15, -0.5),
          titleLarge: display(21, FontWeight.w700, 1.2, -0.3),
          titleMedium:
              body.titleMedium?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
          bodyLarge: body.bodyLarge?.copyWith(fontSize: 17, height: 1.55),
          bodyMedium: body.bodyMedium?.copyWith(fontSize: 15, height: 1.5),
          bodySmall: body.bodySmall?.copyWith(fontSize: 13, height: 1.4),
          labelLarge:
              body.labelLarge?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          labelMedium:
              body.labelMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
        )
        .apply(bodyColor: c.onSurface, displayColor: c.onSurface);
  }

  static ThemeData _build(ColorScheme c) {
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    );
    final buttonText = GoogleFonts.instrumentSans(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: c.brightness,
      colorScheme: c,
      scaffoldBackgroundColor: c.surface,
      textTheme: _textTheme(c),
      dividerTheme: DividerThemeData(color: c.outlineVariant, thickness: 1, space: 1),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.primary,
          foregroundColor: c.onPrimary,
          minimumSize: const Size(0, 52),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          shape: buttonShape,
          textStyle: buttonText,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: c.primary,
          foregroundColor: c.onPrimary,
          elevation: 0,
          minimumSize: const Size(0, 52),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          shape: buttonShape,
          textStyle: buttonText,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.onSurface,
          minimumSize: const Size(0, 52),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          side: BorderSide(color: c.outline.withValues(alpha: 0.6)),
          shape: buttonShape,
          textStyle: buttonText,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.primary,
          textStyle: buttonText,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
    );
  }
}
