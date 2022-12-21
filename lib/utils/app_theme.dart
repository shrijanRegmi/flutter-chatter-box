import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightPalette {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xfff1f2f2),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData(brightness: Brightness.light).colorScheme.copyWith(
            primary: Colors.deepPurple,
            background: Colors.white,
          ),
    );
  }

  static ThemeData get darkPalette {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData(brightness: Brightness.dark).colorScheme.copyWith(
            primary: Colors.black,
            background: const Color(0xff212121),
          ),
    );
  }
}
