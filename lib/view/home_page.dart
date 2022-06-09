import 'package:flutter/material.dart';
import 'package:projeto_jornal/widget/elevated_button_widget.dart';
import 'package:projeto_jornal/widget/list_tile_widget.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontFamily: "Joan", color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButtonWidget(titulo: "Hoje", funcaoDoBotao: () {}),
                ElevatedButtonWidget(titulo: "Ontem", funcaoDoBotao: () {}),
                ElevatedButtonWidget(titulo: "Principais", funcaoDoBotao: () {})
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTileWidget(
                    autor: "autor",
                    titulo: "titulo",
                    functionFavoritos: () {},
                    functionLerNaIntegra: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
