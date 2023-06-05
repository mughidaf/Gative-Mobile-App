import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Home/Component/appbar.dart';

import 'Home/pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gative",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}
