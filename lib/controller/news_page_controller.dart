import 'package:flutter/widgets.dart';
import 'package:projeto_jornal/model/articles_model.dart';
import 'package:projeto_jornal/repository/artigo_repository.dart';

class NewsPageController {
  List<ArtigosModel> todos = [];
  final ArtigoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  NewsPageController([ArtigoRepository? repository])
      : _repository = repository ?? ArtigoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchArtigo();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
