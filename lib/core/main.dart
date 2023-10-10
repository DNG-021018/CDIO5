import 'package:flutter/material.dart';
import 'package:shoes_shop_app/modules/Cart/cart_module.dart';
import 'package:shoes_shop_app/modules/Profile/profile_module.dart';
import '../modules/Authentication/authentication_module.dart';
import '../modules/home/home_module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        ...AuthenticationModule.getRoutes(),
        ...HomeModule.getRoutes(),
        ...ProfileModule.getRoutes(),
        ...CartModule.getRoutes(),
        ...ProfileModule.getRoutes(),
      },
    );
  }
}
