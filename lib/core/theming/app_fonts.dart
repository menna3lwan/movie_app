import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract class AppFonts {
  static const TextStyle appBarTitle = TextStyle(
    color: AppColorsDark.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headlineLarge = TextStyle(
    color: AppColorsDark.textPrimary,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle headlineMedium = TextStyle(
    color: AppColorsDark.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleLarge = TextStyle(
    color: AppColorsDark.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleMedium = TextStyle(
    color: AppColorsDark.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle bodyLarge = TextStyle(
    color: AppColorsDark.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle bodyMedium = TextStyle(
    color: AppColorsDark.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle labelLarge = TextStyle(
    color: AppColorsDark.secondary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: 'Poppins',
    color: AppColorsDark.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
