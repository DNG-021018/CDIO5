import 'package:flutter/material.dart';

import 'Screens/Authentication/check_form.dart';
import 'Screens/Authentication/login_screen.dart';
import 'Screens/Authentication/password_forget.dart';
import 'Screens/Authentication/signup_screen.dart';

class AuthenticationModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/login': (context) => const LoginScreen(),
      '/signup': (context) => const SignupScreen(),
      '/password': (context) => const ForgetPassword(),
      '/check': (context) => const CheckForm(),
    };
  }
}
