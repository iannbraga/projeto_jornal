import 'package:flutter/material.dart';
import 'package:projeto_jornal/view/news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: NewsPage(),
    );
  }
}
