import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),

    textTheme: TextTheme(
      headlineLarge: GoogleFonts.playfairDisplay(
        color: AppColors.textDark,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),

      headlineMedium: GoogleFonts.playfairDisplay(
        color: AppColors.textDark,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),

      bodyLarge: GoogleFonts.poppins(
        color: AppColors.textDark,
      ),

      bodyMedium: GoogleFonts.poppins(
        color: AppColors.textLight,
      ),
    ),

    useMaterial3: true,
  );
}