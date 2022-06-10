import 'package:flutter/widgets.dart';
import 'package:projeto_jornal/model/articles_model.dart';
import 'package:projeto_jornal/repository/artigo_repository.dart';

class HomePageController {
  List<ArtigosModel> artigos = [];
  final ArtigoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomePageController([ArtigoRepository? repository])
      : _repository = repository ?? ArtigoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      artigos = await _repository.fetchArtigosPrincipais();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

  Future search(String word) async {
    state.value = HomeState.loading;
    try {
      artigos = await _repository.fetchArtigoBusca(word);
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
