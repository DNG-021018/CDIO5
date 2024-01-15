import 'package:flutter/material.dart';

import 'Screens/Profile/profile_page.dart';

class ProfileModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/profile': (context) => const ProfilePage(),
    };
  }
}
