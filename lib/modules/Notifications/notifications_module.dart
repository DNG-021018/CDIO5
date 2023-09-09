import 'package:flutter/material.dart';
import 'package:shoes_shop_app/modules/Notifications/screens/notification_page.dart';

class NotificationModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/notifications': (context) => const NotificationsPage(),
    };
  }
}
