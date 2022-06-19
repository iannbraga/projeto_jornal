import 'package:flutter/material.dart';
import 'package:projeto_jornal/controller/home_page_controller.dart';
import 'package:projeto_jornal/view/read_page.dart';
import 'package:projeto_jornal/widget/list_tile_widget.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();
  final TextEditingController filtro = TextEditingController();
  List nomes = [];
  List nomesFiltrados = [];
  Icon iconePesquisa = Icon(Icons.search);
  Widget tituloAppBar = Text("Pesquisar");

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  _success() {
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
                  autor: validaAutor(art.author.toString()),
                  titulo: art.title.toString(),
                  functionLerNoticia: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReadPage(
                              autor: validaAutor(art.author.toString()),
                              titulo: art.title.toString(),
                              descricao: art.description.toString(),
                              url: art.url.toString(),
                            )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  String validaAutor(String autor) {
    if (autor.isEmpty) {
      return "Desconhecido";
    } else if (autor.contains("null")) {
      return "Desconhecido";
    } else {
      return autor;
    }
  }

  _error() {
    return const Center(
      child: Text("Error"),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();

      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home",
            style: TextStyle(
              fontFamily: "Joan",
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
