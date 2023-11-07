import 'package:entrade_x/ui/screen/home/home_screen.dart';
import 'package:entrade_x/ui/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
