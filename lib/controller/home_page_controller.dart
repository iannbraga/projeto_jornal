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
      // ignore: avoid_print
      print(e.hashCode);
    }
  }

  Future search(String word) async {
    try {
      if (word.length > 3) {
        artigos = await _repository.fetchArtigoBusca(word);
      } else {
        artigos = [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.hashCode);
    }
  }
}
