import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color primaryAmber = Color(0xFFFFC107);
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color textGrey = Color(0xFF757575);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color borderGrey = Color(0xFFE0E0E0);

  // Gradients for bookmark cards
  static const List<List<Color>> bookmarkGradients = [
    [Color(0xFFFF9800), Color(0xFFF44336)], // Orange to Red
    [Color(0xFF9C27B0), Color(0xFF673AB7)], // Purple to Deep Purple
    [Color(0xFFE0E0E0), Color(0xFFBDBDBD)], // Light Grey to Grey
    [Color(0xFF4CAF50), Color(0xFF009688)], // Green to Teal
    [Color(0xFF2196F3), Color(0xFF3F51B5)], // Blue to Indigo
    [Color(0xFF795548), Color(0xFFFF9800)], // Brown to Orange
  ];

  // Typography
  static const String fontFamily = 'Poppins';
  
  // Dimensions
  static const double borderRadius = 20.0;
  static const double cardBorderRadius = 15.0;
  static const double bottomNavHeight = 80.0;
  static const double topNavHeight = 60.0;
  
  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 20.0;
  static const double paddingXLarge = 25.0;
  
  // Icon Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeLarge = 24.0;
  static const double iconSizeXLarge = 28.0;
  
  // Font Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXLarge = 18.0;
  static const double fontSizeXXLarge = 20.0;
  static const double fontSizeTitle = 28.0;
  static const double fontSizeHero = 32.0;
  
  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 10,
      offset: const Offset(0, 5),
    ),
  ];
  
  static List<BoxShadow> navShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 5,
      offset: const Offset(0, -2),
    ),
  ];
} 