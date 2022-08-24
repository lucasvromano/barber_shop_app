import 'package:barber_shop/pages/home.page.dart';
import 'package:barber_shop/pages/login.page.dart';
import 'package:barber_shop/pages/mobx.page.dart';
import 'package:barber_shop/pages/post.page.dart';
import 'package:barber_shop/pages/register_post.page.dart';
import 'package:barber_shop/pages/schedules.page..dart';
import 'package:flutter/material.dart';

class BarberShop extends StatelessWidget {
  const BarberShop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        accentColor: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[600],
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/mobx': (context) => const MobxPage(),
        '/post': (context) => const PostPage(),
        '/register_post': (context) => const RegisterPostPage(),
        '/schedules': (context) => const SchedulesPage(),
      },
      home: const LoginPage(),
      // home: const RegisterPostPage(),
    );
  }
}
