import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'VAN';
  static const String appVersion = '1.0.0';
  
  // Colors
  static const Color primaryColor = Colors.deepPurple;
  static const Color secondaryColor = Colors.deepPurpleAccent;
  static const Color errorColor = Colors.red;
  static const Color successColor = Colors.green;
  
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
