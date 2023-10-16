import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: const ColorScheme.dark(),
    primaryColor: const Color(0xFF757575),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF757575), fontSize: 17),
      bodyMedium: TextStyle(color: Color(0xFF757575), fontSize: 14),
    ),
  );
}
