import 'package:flutter/material.dart';

import 'Screens/Home/brand_top.dart';
import 'Screens/Home/home_screen.dart';

class HomeModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/home': (context) => const HomeScreen(),
      '/brand': (context) => const MyBrand(),
    };
  }
}
