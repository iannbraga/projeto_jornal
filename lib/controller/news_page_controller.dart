import 'package:flutter/widgets.dart';
import 'package:projeto_jornal/model/articles_model.dart';
import 'package:projeto_jornal/repository/artigo_repository.dart';

class NewsPageController {
  List<ArtigosModel> todos = [];
  final ArtigoRepository _repository;
  final state = ValueNotifier<NewsState>(NewsState.start);

  NewsPageController([ArtigoRepository? repository])
      : _repository = repository ?? ArtigoRepository();

  Future start() async {
    state.value = NewsState.loading;
    try {
      //todos = await _repository.fetchArtigosPrincipais();
      todos = await _repository.fetchArtigoBusca('corno');
      state.value = NewsState.success;
    } catch (e) {
      state.value = NewsState.error;
    }
  }
}

enum NewsState { start, loading, success, error }
