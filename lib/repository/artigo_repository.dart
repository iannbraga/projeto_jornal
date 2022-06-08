import 'package:dio/dio.dart';
import 'package:projeto_jornal/model/articles_model.dart';

class ArtigoRepository {
  final dio = Dio();
  final url =
      "https://newsapi.org/v2/top-headlines?country=br&apiKey=2d6b45469a2a45b6b7acf734bcde27f4";

  Future<List<ArtigosModel>> fetchArtigo() async {
    final response = await dio.get(url);

    final list = response.data['articles'] as List;

    List<ArtigosModel> artigos = [];

    for (var json in list) {
      final artigo = ArtigosModel.fromJson(json);
      artigos.add(artigo);
    }
    return artigos;
  }
}
