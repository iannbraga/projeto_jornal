import 'package:dio/dio.dart';
import 'package:projeto_jornal/model/articles_model.dart';

class ArtigoRepository {
  final String apiKey = '057a7c050cf247eba186d583de18c506';
  final String apiKey2 = '1e656690bc5d4ae2b9372997fed4355c';

  final urlSearchNews = "https://newsapi.org/v2/everything";
  final urlTopHeadlines = "https://newsapi.org/v2/top-headlines";

  final dio = Dio();

  Future<List<ArtigosModel>> fetchArtigosPrincipais() async {
    //final response = await dio.get(urlTopHeadlines);
    final response = await dio.get(urlTopHeadlines, queryParameters: {
      'country': 'br',
      'apiKey': apiKey2,
    });
    final list = response.data['articles'] as List;

    List<ArtigosModel> artigos = [];

    for (var json in list) {
      final artigo = ArtigosModel.fromJson(json);
      artigos.add(artigo);
    }
    return artigos;
  }

  Future<List<ArtigosModel>> fetchArtigoBusca(String termo) async {
    final response = await dio.get(urlSearchNews, queryParameters: {
      'q': termo,
      'language': 'pt',
      'sortBy': 'relevancy',
      'apiKey': apiKey2,
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
