import 'package:flutter/material.dart';

import '../authentication_module.dart';
import '../cart_module.dart';
import '../home_module.dart';
import '../profile_module.dart';

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
