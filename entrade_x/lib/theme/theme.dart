import 'package:entrade_x/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_textstyle.dart';

const _lightTextColor = Colors.black;
const _darkTextColor = Colors.white;

final ThemeData lightThemeData = ThemeData(
  scaffoldBackgroundColor: AppColor.bgLight,
  textTheme: lightTextTheme,
  colorScheme: _lightColorScheme,
  primaryColor: AppColor.greyCustomPrimary,
  hintColor: AppColor.greyCustomPrimary,
  appBarTheme: _lightAppBarTheme,
  iconTheme: _lightIconThemeData,

);

final ThemeData darkThemeData = ThemeData(
  scaffoldBackgroundColor: AppColor.bgDark,
  textTheme: darkTextTheme,
  primaryColor: AppColor.greyCustomPrimary,
  hintColor: AppColor.greyCustomPrimary,
  colorScheme: _darkColorScheme,
  appBarTheme: _darkAppBarTheme,
  iconTheme: _darkIconThemeData,
);

//text theme --
final TextTheme lightTextTheme = TextTheme(
  bodyLarge: AppTextStyle.text30Bold.copyWith(color: _lightTextColor),
  bodyMedium: AppTextStyle.text16Normal.copyWith(color: _lightTextColor),
  bodySmall: AppTextStyle.text11Normal.copyWith(color: _lightTextColor),
);

final TextTheme darkTextTheme = TextTheme(
  bodyLarge: AppTextStyle.text30Bold.copyWith(color: _darkTextColor),
  bodyMedium: AppTextStyle.text16Normal.copyWith(color: _darkTextColor),
  bodySmall: AppTextStyle.text11Normal.copyWith(color: _darkTextColor),
);

//Icon theme --
const IconThemeData _lightIconThemeData =
    IconThemeData(color: AppColor.redPrimary);

const IconThemeData _darkIconThemeData =
    IconThemeData(color: AppColor.redPrimary);

//Appbar --
final AppBarTheme _lightAppBarTheme = AppBarTheme(
  elevation: 2.0,
  titleSpacing: 16.0,
  backgroundColor: AppColor.bgAppBarLight,
  foregroundColor: AppColor.fgAppBarLight,
  iconTheme: const IconThemeData(
      color: Colors.black
  ),
  centerTitle: false,
  titleTextStyle: AppTextStyle.text16Normal.copyWith(
    color: AppColor.blackPrimary,
    fontWeight: FontWeight.w700,
  ),
);

final AppBarTheme _darkAppBarTheme = AppBarTheme(
  elevation: 2,
  titleSpacing: 16.0,
  iconTheme: const IconThemeData(
    color: Colors.white
  ),
  backgroundColor: AppColor.bgAppBarDark,
  foregroundColor: AppColor.fgAppBarDark,
  centerTitle: false,
  titleTextStyle: AppTextStyle.text16Normal.copyWith(
    color: AppColor.whitePrimary,
    fontWeight: FontWeight.w700,
  ),
);

const ColorScheme _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.redPrimary,
  onPrimary: Colors.white,
  secondary: AppColor.secondary,
  onSecondary: Colors.white,
  error: AppColor.redPrimary,
  onError: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
  surface: AppColor.redPrimary,
  onSurface: Colors.white,
);
const ColorScheme _darkColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.redPrimary,
  onPrimary: AppColor.blackPrimary,
  secondary: AppColor.secondary,
  onSecondary: Colors.white,
  error: AppColor.whitePrimary,
  onError: Colors.white,
  background: Colors.black,
  onBackground: Colors.white,
  surface: AppColor.redPrimary,
  onSurface: Colors.white,
);
