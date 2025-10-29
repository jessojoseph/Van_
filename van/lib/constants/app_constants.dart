import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Forest VAN';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Journey Through Nature';
  
  // Forest-inspired Colors
  static const Color primaryColor = Color(0xFF2E7D32); // Forest Green
  static const Color secondaryColor = Color(0xFF4CAF50); // Light Green
  static const Color accentColor = Color(0xFF8BC34A); // Lime Green
  static const Color earthBrown = Color(0xFF5D4037); // Tree Bark Brown
  static const Color leafGreen = Color(0xFF689F38); // Leaf Green
  static const Color mossGreen = Color(0xFF558B2F); // Moss Green
  static const Color skyBlue = Color(0xFF81C784); // Forest Sky
  static const Color sunYellow = Color(0xFFFFD54F); // Sunlight
  static const Color errorColor = Color(0xFFD32F2F); // Natural Red
  static const Color successColor = Color(0xFF388E3C); // Success Green
  
  // Nature Gradients
  static const List<Color> forestGradient = [
    Color(0xFF1B5E20), // Dark Forest
    Color(0xFF2E7D32), // Forest Green
    Color(0xFF4CAF50), // Light Green
  ];
  
  static const List<Color> sunsetGradient = [
    Color(0xFFFF8A65), // Sunset Orange
    Color(0xFFFFB74D), // Golden Hour
    Color(0xFFFFD54F), // Sunlight
  ];
  
  static const List<Color> earthGradient = [
    Color(0xFF3E2723), // Dark Earth
    Color(0xFF5D4037), // Tree Bark
    Color(0xFF8D6E63), // Light Earth
  ];
  
  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  // Border Radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;
  
  // Animation Duration
  static const Duration animationDuration = Duration(milliseconds: 300);
  
  // API Configuration (if needed)
  static const String baseUrl = 'https://api.example.com';
  static const Duration timeoutDuration = Duration(seconds: 30);
}
