import 'package:flutter/material.dart';
import 'package:projeto_jornal/controller/home_page_controller.dart';
import 'package:projeto_jornal/view/read_page.dart';
import 'package:projeto_jornal/widget/list_tile_widget.dart';

class CustomSearchDelegated extends SearchDelegate {
  final controller = HomePageController();
  List<String> list = [];

  List<String> noticias = [];

  corrigeTexto(String texto) {
    if (texto.contains('null')) {
      texto = 'Desconhecido';
      return texto;
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isNotEmpty) {
            query = "";
          } else {
            close(context, query);
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: controller.search(query),
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
                      autor: art.author.toString(),
                      titulo: art.title.toString(),
                      functionLerNoticia: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadPage(
                            autor: art.author.toString(),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: controller.search(query),
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
                      autor: art.author.toString(),
                      titulo: art.title.toString(),
                      functionLerNoticia: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadPage(
                            autor: art.author.toString(),
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
    );
  }
}
