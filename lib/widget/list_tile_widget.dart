import 'package:flutter/material.dart';
import 'package:projeto_jornal/widget/text_autor_widget.dart';
import 'package:projeto_jornal/widget/text_titulo_widget.dart';

class ListTileWidget extends StatelessWidget {
  final String titulo;
  final String autor;
  final Function functionLerNoticia;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ListTileWidget({
    required this.autor,
    required this.titulo,
    required this.functionLerNoticia,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
              title: TextTituloWidget(conteudo: titulo),
              subtitle: TextAutorWidget(autor: autor),
              trailing: IconButton(
                onPressed: () => functionLerNoticia(),
                icon: const Icon(Icons.arrow_forward),
              )),
        ],
      ),
    );
  }
}
