import 'package:dio/dio.dart';
import 'package:projeto_jornal/model/articles_model.dart';

class ArtigoRepository {
  final baseUrl = "https://newsapi.org/v2/everything";
  final dio = Dio();
  final url =
      "https://newsapi.org/v2/top-headlines?country=br&apiKey=2d6b45469a2a45b6b7acf734bcde27f4";

  Future<List<ArtigosModel>> fetchArtigosPrincipais() async {
    final response = await dio.get(url);
    final list = response.data['articles'] as List;

    List<ArtigosModel> artigos = [];

    for (var json in list) {
      final artigo = ArtigosModel.fromJson(json);
      artigos.add(artigo);
    }
    return artigos;
  }

  Future<List<ArtigosModel>> fetchArtigoBusca(String termo) async {
    final response = await dio.get(baseUrl, queryParameters: {
      'q': termo,
      'apiKey': '2d6b45469a2a45b6b7acf734bcde27f4'
    });
    final list = response.data['articles'] as List;

    List<ArtigosModel> artigos = [];

    for (var json in list) {
      final artigo = ArtigosModel.fromJson(json);
      artigos.add(artigo);
    }
    return artigos;
  }
}
