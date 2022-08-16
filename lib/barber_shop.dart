import 'package:barber_shop/pages/login.page.dart';
import 'package:flutter/material.dart';

class BarberShop extends StatelessWidget {
  const BarberShop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber Shop',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        accentColor: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[600],
        ),
      ),
      // home: const LoginPage(),
      home: const LoginPage(),
    );
  }
}
