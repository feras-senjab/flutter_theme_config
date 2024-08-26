import 'package:flutter/material.dart';

import '../../theme_manager.dart';

class BaseTextTheme {
  static TextTheme get property {
    final colorScheme = ThemeManager().colorScheme;

    return TextTheme(
      bodyMedium: TextStyle(
        color: colorScheme.onSurface,
      ),
    );
  }
}
