import 'package:flutter/material.dart';
import 'package:projeto_jornal/controller/news_page_controller.dart';

// ignore: use_key_in_widget_constructors
class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controller = NewsPageController();
  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notícias"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
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

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var art = controller.todos[index];
        return ListTile(
          title: Text(art.title.toString()),
          subtitle: Text(art.description.toString()),
        );
      },
    );
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
}
