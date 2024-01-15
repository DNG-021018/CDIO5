import 'package:flutter/material.dart';

import 'Screens/Notifications/notification_page.dart';

class NotificationModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/notifications': (context) => const NotificationsPage(),
    };
  }
}
