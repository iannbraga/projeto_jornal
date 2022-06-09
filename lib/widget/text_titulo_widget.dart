import 'package:flutter/material.dart';

class TextTituloWidget extends StatelessWidget {
  final String conteudo;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TextTituloWidget({required this.conteudo});

  @override
  Widget build(BuildContext context) {
    return Text(
      conteudo,
      style: const TextStyle(
        fontFamily: "Joan",
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
