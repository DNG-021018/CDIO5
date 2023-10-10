import 'package:flutter/material.dart';
import 'package:shoes_shop_app/modules/Cart/screens/cart_page.dart';
import 'package:shoes_shop_app/modules/Cart/screens/pay.dart';

class CartModule {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/cart': (context) => const ShoppingCartPage(),
      '/checkout': (context) => const CheckOutScreen(),
    };
  }
}
