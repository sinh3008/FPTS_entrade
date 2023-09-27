import 'package:flutter/material.dart';

import 'body/body_login.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BodyLogin();
  }
}
