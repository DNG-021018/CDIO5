import 'package:flutter/material.dart';

import 'Screens/Cart/cart_page.dart';
import 'Screens/Cart/pay.dart';

class CartModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/cart': (context) => const ShoppingCartPage(),
      '/checkout': (context) => const CheckOutScreen(),
    };
  }
}
