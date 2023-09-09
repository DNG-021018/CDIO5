import 'package:flutter/material.dart';
import 'package:shoes_shop_app/modules/Profile/screens/profile_page.dart';

class ProfileModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/profile': (context) => const ProfilePage(),
    };
  }
}
