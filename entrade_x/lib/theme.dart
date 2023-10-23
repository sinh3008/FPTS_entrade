import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: const Color(0xffd34343),
    ),
    primaryColor: const Color(0xFF757575),
    hintColor: Colors.grey,
    focusColor: Colors.grey,
    textTheme:  const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
      bodyMedium: TextStyle(color: Color(0xFF757575), fontSize: 15, fontWeight: FontWeight.w400),
    ),
  );
}
