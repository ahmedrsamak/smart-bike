// colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // Core theme
  static const Color primary = Color(0xFF4FC3F7);         // Light blue
  static const Color background = Color(0xFF121212);      // Dark background for AMOLED
  static const Color darkCard = Color(0xFF1E1E1E);         // Card background
  static const Color lightCard = Color(0xFF2A2A2A);        // Alternate card background

  // Semantic state colors
  static const Color success = Color(0xFF4CAF50);          // Green
  static const Color warning = Color(0xFFFFC107);          // Amber
  static const Color danger = Color(0xFFF44336);           // Red

  // Text & UI
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color border = Colors.grey;
  static const Color transparent = Colors.transparent;

  // Optional extras
  static const Color fuel = Color(0xFFff9800);              // Fuel-related highlights
  static const Color maintenance = Color(0xFF8BC34A);       // Maintenance green
}
