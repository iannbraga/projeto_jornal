import 'package:flutter/material.dart';

class TextAutorWidget extends StatelessWidget {
  final String autor;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  TextAutorWidget({required this.autor});

  @override
  Widget build(BuildContext context) {
    return Text(
      autor, //AUTOR
      style: const TextStyle(
        fontFamily: "OpenSans",
        color: Colors.black,
        fontSize: 12,
      ),
    );
  }
}
