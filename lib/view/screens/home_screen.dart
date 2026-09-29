import 'package:flutter/material.dart';
import 'package:news_app/core/data/api_manger.dart';
import 'package:news_app/core/data/news_model.dart';
import 'package:news_app/view/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('News'))),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ItemCardNews(article: articles[index]);
        },
      ),
    );
  }

  void getArticles() async {
    var newsModel = await ApiManger.getNews();
    articles = newsModel.articles ?? [];
    setState(() {});
  }
}
