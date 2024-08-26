import 'package:flutter/material.dart';
import 'package:flutter_theme_config/Style/colors.dart';

import '../../theme_manager.dart';

class BaseInputDecorationTheme {
  static InputDecorationTheme get property {
    final colorScheme = ThemeManager().colorScheme;
    final brightness = ThemeManager().brightness;

    return InputDecorationTheme(
      filled: true,
      fillColor:
          brightness == Brightness.light ? Colors.grey[200] : Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
          width: 2,
        ),
      ),
      labelStyle: TextStyle(color: colorScheme.primary),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
