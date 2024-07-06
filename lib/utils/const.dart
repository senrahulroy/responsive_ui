import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF4A5568);
  static const Color white1 = Color(0xFFF7FAFC);

  static const Color greyL = Color(0xFF718096);
  static const Color primary = Color(0xFFEBF4FF);
  static const Color black = Color(0xFF2D3748);
  static const LinearGradient bgGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF319795), // #319795
      Color(0xFF3182CE), // #3182CE
    ],
  );

  static const LinearGradient magentaGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFEBF4FF), // #319795
      Color(0xFFE6FFFA), // #3182CE
    ],
  );
  static const Color whiteCream = Color(0xFFCBD5E0);
  static const Color magentaLight = Color(0xFF81E6D9);
  static const Color magenta = Color(0xFF319795);

  // static const Color primary = Color(0xFF000029);
  // static const Color primary = Color(0xFF319795);
  // static const Color primary = Color(0xFF319795);
  // static const Color primary = Color(0xFF319795);
}

class AppTextStyle {}

class AppSized {}
