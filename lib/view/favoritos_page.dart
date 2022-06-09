import 'package:flutter/material.dart';
import 'package:projeto_jornal/widget/list_tile_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: use_key_in_widget_constructors
class FavoritosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favoritas",
          style: TextStyle(fontFamily: "Joan", color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTileWidget(
                autor: "autor",
                titulo: "titulo",
                functionFavoritos: () {},
                functionLerNaIntegra: () => launchUrlString(
                  "https://www.google.com.br",
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
