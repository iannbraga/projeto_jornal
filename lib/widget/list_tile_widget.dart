import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String titulo;
  final String autor;
  final Function functionFavoritos;
  final Function functionLerNaIntegra;

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
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                autor, //AUTOR
                style: const TextStyle(
                  fontFamily: "OpenSans",
                  color: Colors.black,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: functionFavoritos(),
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: functionLerNaIntegra(),
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
