import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/core/data/news_model.dart';

class ApiManger {
  static Future<ResultApi<NewsModel>> getNews() async {
    // 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=d99f3b3366f942e7a2238069075ca5d7');
    try {
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        "q": "bitcoin",
        "apiKey": "d99f3b3366f942e7a2238069075ca5d7",
      });
      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseString = response.body;
        var json = jsonDecode(responseString);
        return Success(NewsModel.fromJson(json));
      } else {
        return Error("Error from server");
      }
    } on SocketException {
      return Error("No Internet Connection");
    } catch (e) {
      return Error(e.toString());
    }
  }
}
