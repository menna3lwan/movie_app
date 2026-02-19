import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_fonts.dart';

abstract class AppTheme {
  static ThemeData get darkTheme => ThemeData(
<<<<<<< HEAD
=======
        fontFamily: 'Poppins',
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          error: AppColors.error,
        ),
        scaffoldBackgroundColor: AppColors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppFonts.appBarTitle,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 12),
        ),
<<<<<<< HEAD
        fontFamily: "Poppins",
=======
>>>>>>> df95b67d114e919723fb677e6bafe9b35ef78d93
        textTheme: TextTheme(
          headlineLarge: AppFonts.headlineLarge,
          headlineMedium: AppFonts.headlineMedium,
          titleLarge: AppFonts.titleLarge,
          titleMedium: AppFonts.titleMedium,
          bodyLarge: AppFonts.bodyLarge,
          bodyMedium: AppFonts.bodyMedium,
          labelLarge: AppFonts.labelLarge,
        ),
      );
}
