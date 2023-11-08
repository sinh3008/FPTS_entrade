import 'package:flutter/material.dart';

class AppTextStyle {
  static const _defaultTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
  );

  static final text30Bold =
      _defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.bold);
  static final text15Normal =
      _defaultTextStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
  static final text14Normal =
      _defaultTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w400);
  static final text11Normal =
  _defaultTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w400);
}
