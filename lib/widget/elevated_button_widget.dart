import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String titulo;
  final Function funcaoDoBotao;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ElevatedButtonWidget({required this.titulo, required this.funcaoDoBotao});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funcaoDoBotao(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      child: Text(
        titulo,
        style: const TextStyle(
          fontFamily: "Joan",
          color: Colors.black,
        ),
      ),
    );
  }
}
