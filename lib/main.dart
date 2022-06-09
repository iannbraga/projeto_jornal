import 'package:flutter/material.dart';
import 'package:projeto_jornal/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      //home: NewsPage(),
      home: HomePage(),
    );
  }
}
