import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Home/Component/appbar.dart';
import 'package:gative_mobile_ver/Home/pages/DetailItemPage.dart';
import 'package:gative_mobile_ver/Home/pages/WishlistPage.dart';
import 'package:gative_mobile_ver/Home/pages/cartpage.dart';
import 'package:gative_mobile_ver/Home/pages/LoginPage.dart';
import 'package:gative_mobile_ver/Home/pages/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gative",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/detail': (context) => DetailItemPage(),
        '/wishlist': (context) => WishlistPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
