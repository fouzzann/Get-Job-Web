// lib/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF2871FA);
  static const Color primaryPurple = Color(0xFF800080); // Purple from your app bar
  static const Color accentPurple = Color.fromARGB(255, 201, 86, 221); // Your notification icon color
  
  // Background Colors
  static const Color appBackground = Color(0xFFF5F5F5); // Colors.grey[50]
  static const Color cardBackground = Colors.white;
  static const Color appBarBackground = Colors.white;
  
  // Text Colors
  static const Color textDark = Colors.black87;
  static const Color textMedium = Colors.black54;
  static const Color textLight = Colors.grey;
  static const Color textSuccess = Color(0xFF4CAF50); // Green for profile completion
  
  // UI Colors
  static const Color cardBorder = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocused = Color(0xFF2871FA);
  
  // Shadow Colors
  static const Color shadowLight = Color.fromARGB(26, 124, 122, 122); // 10% black
  static const Color shadowMedium = Color.fromARGB(37, 255, 255, 255); // 15% black
  static const Color shadowDark = Color.fromARGB(51, 255, 255, 255); // 20% black
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Button Colors
  static const Color buttonPrimary = Color(0xFF2871FA);
  static const Color buttonSecondary = Color(0xFFE3F2FD);
  static const Color buttonBorder = Color(0xFF90CAF9);
  static const Color white = Colors.white;
  
  static const Color black = Colors.black87;
  static const Color greyLight = Color(0xFFEEEEEE);
  static const Color greyDark = Color(0xFF212121);
  static const Color greyMedium = Colors.grey;
  static const Color greyText = Color(0xFF757575);
  static const Color primaryBlueLight = Color(0xFF90CAF9);
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Colors.white, Color(0xFFFAFAFA)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
} 