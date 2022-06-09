import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String titulo;
  final String autor;
  final Function functionFavoritos;
  final Function functionLerNaIntegra;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ListTileWidget({
    required this.autor,
    required this.titulo,
    required this.functionFavoritos,
    required this.functionLerNaIntegra,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
              title: Text(
                titulo, //TITULO
                style: const TextStyle(
                  fontFamily: "Joan",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                autor, //AUTOR
                style: const TextStyle(
                  fontFamily: "OpenSans",
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: () => functionFavoritos,
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () => functionLerNaIntegra(),
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
