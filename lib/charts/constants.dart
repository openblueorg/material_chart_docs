
// Stunning Teal & Orange Color Palette
import 'package:flutter/material.dart';

class AppColors {
  // Primary Teal Gradient
  static const Color darkestTeal = Color(0xFF012E40); // #012E40
  static const Color darkTeal = Color(0xFF025159); // #025159
  static const Color primary = Color(0xFF038C8C); // #038C8C
  static const Color lightTeal = Color(0xFF03A696); // #03A696

  // Accent Orange
  static const Color accent = Color(0xFFF28705); // #F28705

  // Derived colors for better UI
  static const Color primaryLight = Color(0xFF4DB6AC);
  static const Color accentLight = Color(0xFFFFB74D);
  static const Color accentDark = Color(0xFFE65100);

  // Surface and background colors
  static const Color surface = Color(0xFFF8FFFE);
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFF5FDFC);
  static const Color sidebarBackground = Color(0xFFFBFEFE);

  // Text colors
  static const Color textPrimary = Color(0xFF012E40);
  static const Color textSecondary = Color(0xFF025159);
  static const Color textLight = Color(0xFF4A6B73);

  // Border and divider colors
  static const Color border = Color(0xFFE0F4F3);
  static const Color divider = Color(0xFFF0F9F8);

  // Chart palette with the stunning teal-orange theme
  static const List<Color> chartPalette = [
    primary, // Teal
    accent, // Orange
    lightTeal, // Light Teal
    accentLight, // Light Orange
    darkTeal, // Dark Teal
    accentDark, // Dark Orange
    primaryLight, // Soft Teal
    Color(0xFF80CBC4), // Mint
  ];

  // Special gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [darkTeal, primary, lightTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentDark, accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
