import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colores parecidos a los de Disney+
  static const Color fondo = Color(0xFF040714);
  static const Color superficie = Color(0xFF1A1D29);
  static const Color acento = Color(0xFF0063E5);

  static ThemeData get tema {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: fondo,
      colorScheme: const ColorScheme.dark(
        primary: acento,
        surface: superficie,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.mulish(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        color: superficie,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white24, width: 1),
        ),
      ),
      textTheme: TextTheme(
        // Fuente 1: títulos
        titleLarge: GoogleFonts.mulish(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.3,
          color: Colors.white,
        ),
        // Fuente 2: subtítulos y etiquetas
        titleMedium: GoogleFonts.nunitoSans(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          color: Colors.white,
        ),
        // Fuente 3: texto normal
        bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          color: Colors.white70,
        ),
      ),
    );
  }
}
