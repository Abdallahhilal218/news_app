import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/core/data/api_manger.dart';
import 'package:news_app/core/data/news_model.dart';
import 'package:news_app/view_model/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsLoading());

  void getArticles() async {
    emit(NewsLoading());
    final result = await ApiManger.getNews();
    // articles = newsModel.articles ?? [];
    // setState(() {});
    switch (result) {
      case Success<NewsModel>():
        var articles = result.data.articles ?? [];
        emit(NewsSuccess(articles));
      case Error<NewsModel>():
        var error = result.error;
        emit(NewsError(error));
    }
  }
}
