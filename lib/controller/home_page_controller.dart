import 'package:projeto_jornal/model/articles_model.dart';
import 'package:projeto_jornal/repository/artigo_repository.dart';

class HomePageController {
  List<ArtigosModel> artigos = [];
  final ArtigoRepository _repository;

  HomePageController([ArtigoRepository? repository])
      : _repository = repository ?? ArtigoRepository();

  Future start() async {
    try {
      artigos = await _repository.fetchArtigosPrincipais();
    } catch (e) {
      print(e.hashCode);
    }
  }

  Future search(String word) async {
    try {
      artigos = await _repository.fetchArtigoBusca(word);
    } catch (e) {
      print(e.hashCode);
    }
  }
}

enum HomeState { start, loading, success, error }
