import 'package:flutter/material.dart';
import 'package:shoes_shop_app/modules/Authentication/screens/login_screen.dart';
import 'package:shoes_shop_app/modules/Authentication/screens/signup_screen.dart';

class AuthenticationModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/login': (context) => const LoginScreen(),
      '/signup': (context) => const SignupScreen(),
    };
  }
}
