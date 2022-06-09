import 'package:flutter/material.dart';

class TextDescricaoWidget extends StatelessWidget {
  final String descricao;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TextDescricaoWidget({required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Text(
      descricao,
      style: const TextStyle(
        fontFamily: "OpenSans",
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }
}
