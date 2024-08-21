import 'package:dio/dio.dart';
import '../models/article.dart';

class NewsServices {
  Dio dio = Dio();
  Future<List<Article>> getData(
      {required String path, required Map<String, dynamic> query}) async {
    Response response = await dio.get(path, queryParameters: query);
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData["articles"];
    List<Article> articleList = [];
    for (var article in articles) {
      articleList.add(Article.fromJson(article));
    }
    return articleList;
  }
}
