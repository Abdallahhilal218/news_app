import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/data/news_model.dart';
import 'package:news_app/view/widgets/item_card.dart';
import 'package:news_app/view_model/news_cubuit.dart';
import 'package:news_app/view_model/news_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<NewsCubit>(context).getArticles();
  }

  bool isLoading = true;
  String? error;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocProvider(
          create: (context) => NewsCubit()..getArticles(),
          child: Scaffold(
            appBar: AppBar(title: Center(child: Text('News'))),
            body: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return _isloadingWidget();
                } else if (state is NewsError) {
                  return _errorWidget(state.errormassage);
                } else if (state is NewsSuccess) {
                  return _successWidget(state.articles);
                }
                return _isloadingWidget();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _successWidget(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ItemCardNews(article: articles[index]);
      },
    );
  }

  Widget _isloadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _errorWidget(String? error) {
    return Center(
      child: Text(
        error ?? 'An error occurred',
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
    );
  }
}
