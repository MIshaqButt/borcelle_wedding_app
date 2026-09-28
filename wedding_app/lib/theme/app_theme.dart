import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Global luxury gold & dark accents
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldBright = Color(0xFFFFD700);
  static const Color goldLight = Color(0xFFFAE19C);
  static const Color darkBg = Color(0xFF0F0B10);
  static const Color cardDark = Color(0xFF1A141D);
  static const Color ivory = Color(0xFFFAF8F5);

  // Mehndi Palette
  static const Color mehndiAmber = Color(0xFFD97706);
  static const Color mehndiYellow = Color(0xFFF59E0B);
  static const Color mehndiGreen = Color(0xFF059669);
  static const Color mehndiDarkBg = Color(0xFF140D05);

  // Barat Palette
  static const Color baratCrimson = Color(0xFF881337);
  static const Color baratMaroon = Color(0xFF4C0519);
  static const Color baratDarkBg = Color(0xFF14050A);

  // Walima Palette
  static const Color walimaGold = Color(0xFFC5A059);
  static const Color walimaSilver = Color(0xFF94A3B8);
  static const Color walimaDarkBg = Color(0xFF0F1218);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBg,
      primaryColor: gold,
      cardColor: cardDark,
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      colorScheme: const ColorScheme.dark(
        primary: gold,
        secondary: goldBright,
        surface: cardDark,
      ),
    );
  }

  // Heading Style
  static TextStyle headingStyle({Color color = goldLight, double fontSize = 24}) {
    return GoogleFonts.playfairDisplay(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    );
  }

  // Regal Calligraphic Script
  static TextStyle scriptStyle({Color color = goldBright, double fontSize = 28}) {
    return GoogleFonts.greatVibes(
      color: color,
      fontSize: fontSize,
    );
  }

  // Subtitle / Body Style
  static TextStyle bodyStyle({Color color = Colors.white70, double fontSize = 14}) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      height: 1.5,
    );
  }
}
