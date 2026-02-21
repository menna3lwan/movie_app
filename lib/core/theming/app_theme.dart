import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_fonts.dart';

abstract class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: AppColorsDark.primary,
          secondary: AppColorsDark.secondary,
          surface: AppColorsDark.surface,
          error: AppColorsDark.error,
          tertiary: AppColorsDark.accent,
          onPrimary: AppColorsDark.textPrimary,
          onSurface:
              AppColorsDark.background, 
          onSurfaceVariant: AppColorsDark.textSecondary,
          primaryContainer: AppColorsDark.star,
          onInverseSurface: AppColorsDark.offwhite,
          outline: AppColorsDark.divider,
          outlineVariant: AppColorsDark.grey,
          surfaceContainerHighest: AppColorsDark.whiteGray,
          surfaceContainerHigh: AppColorsDark.darkWhite,
          inverseSurface: AppColorsDark.lightDark,
        ),
        scaffoldBackgroundColor: AppColorsDark.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsDark.primary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppFonts.appBarTitle,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorsDark.primary,
          selectedItemColor: AppColorsDark.secondary,
          unselectedItemColor: AppColorsDark.textSecondary,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 12),
        ),
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
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        useMaterial3: false,
        colorScheme: const ColorScheme.light(
          primary: AppColorsLight.primary,
          secondary: AppColorsLight.secondary,
          surface: AppColorsLight.surface,
          error: AppColorsLight.error,
          onPrimary: AppColorsLight.textPrimary,
          onSurface: AppColorsLight.textSecondary,
          onSurfaceVariant: AppColorsLight.textSecondary,
          primaryContainer: AppColorsLight.star,
          onInverseSurface: AppColorsLight.offwhite,
          outline: AppColorsLight.divider,
          outlineVariant: AppColorsLight.grey,
          surfaceContainerHighest: AppColorsLight.whiteGray,
          surfaceContainerHigh: AppColorsLight.darkWhite,
          inverseSurface: AppColorsLight.lightDark,
        ),
        scaffoldBackgroundColor: AppColorsLight.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsLight.primary,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColorsLight.textPrimary),
          titleTextStyle:
              AppFonts.appBarTitle.copyWith(color: AppColorsLight.textPrimary),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorsLight.primary,
          selectedItemColor: AppColorsLight.secondary,
          unselectedItemColor: AppColorsLight.textSecondary,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 12),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColorsLight.surface,
          filled: true,
          hintStyle: const TextStyle(color: AppColorsLight.textSecondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        textTheme: TextTheme(
          headlineLarge: AppFonts.headlineLarge,
          headlineMedium: AppFonts.headlineMedium,
          titleLarge: AppFonts.titleLarge,
          titleMedium: AppFonts.titleMedium,
          bodyLarge: AppFonts.bodyLarge,
          bodyMedium: AppFonts.bodyMedium,
          labelLarge: AppFonts.labelLarge,
        ).apply(
          bodyColor: AppColorsLight.textSecondary,
          displayColor: AppColorsLight.textSecondary,
        ),
      );
}
