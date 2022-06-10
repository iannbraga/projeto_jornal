import 'package:flutter/material.dart';
import 'package:projeto_jornal/widget/text_autor_widget.dart';
import 'package:projeto_jornal/widget/text_descricao_widget.dart';
import 'package:projeto_jornal/widget/text_titulo_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: use_key_in_widget_constructors
class ReadPage extends StatelessWidget {
  final String autor;
  final String titulo;
  final String descricao;
  final String url;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ReadPage({
    required this.autor,
    required this.titulo,
    required this.descricao,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(""),
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                launchUrlString("whatsapp://send?phone?&text=$url"),
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: TextAutorWidget(autor: autor),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextTituloWidget(conteudo: titulo),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextDescricaoWidget(descricao: descricao),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () => launchUrlString(url),
                    child: const Text(
                      "Ler na íntegra",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  abrirWhatsApp(String mensagem) async {
    var whatsappUrl = "whatsapp://send?phone?text=";

    if (await canLaunchUrlString(whatsappUrl)) {
      await launchUrlString(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
