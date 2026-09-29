import 'package:news_app/core/data/news_model.dart';

abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  List<Article> articles;
  NewsSuccess(this.articles);
}

class NewsError extends NewsState {
  String errormassage;
  NewsError(this.errormassage);
}
