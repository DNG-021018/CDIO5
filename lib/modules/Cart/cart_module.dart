import 'package:flutter/material.dart';
import 'package:shoes_shop_app/modules/Cart/screens/cart_page.dart';

class CartModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/cart': (context) => const ShoppingCartPage(),
    };
  }
}
