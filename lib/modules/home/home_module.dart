import 'package:flutter/material.dart';
import 'package:shoes_shop_app/modules/home/screens/home_screen.dart';

class HomeModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/home': (context) => const HomeScreen(),
    };
  }
}
