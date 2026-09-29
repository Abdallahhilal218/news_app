import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/data/news_model.dart';

class ApiManger {
  static Future<NewsModel> getNews() async {
    // 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=d99f3b3366f942e7a2238069075ca5d7');
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "q": "bitcoin",
      "apiKey": "d99f3b3366f942e7a2238069075ca5d7",
    });
    var response = await http.get(url);
    var responseString = response.body;
    var json = jsonDecode(responseString);
    return NewsModel.fromJson(json);
  }
}
