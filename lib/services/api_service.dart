import 'dart:convert';
import 'package:news_articles/model/article_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=eb03015a04e741a8a318832fbea10aa2";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the articles!");
    }
  }
}
