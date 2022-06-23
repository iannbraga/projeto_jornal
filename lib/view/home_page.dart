import 'package:flutter/material.dart';
import 'package:projeto_jornal/controller/home_page_controller.dart';
import 'package:projeto_jornal/view/read_page.dart';
import 'package:projeto_jornal/widget/custom_search_delegated.dart';
import 'package:projeto_jornal/widget/list_tile_widget.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();

  trataTexto(String texto) {
    if (texto.contains('null')) return 'Desconhecido';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            fontFamily: "Joan",
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegated());
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.start(),
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.artigos.length,
                    itemBuilder: (context, index) {
                      var art = controller.artigos[index];
                      return ListTileWidget(
                        autor: '',
                        titulo: art.title.toString(),
                        functionLerNoticia: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadPage(
                              autor: '',
                              titulo: art.title.toString(),
                              descricao: art.description.toString(),
                              url: art.url.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
