import 'package:flutter/material.dart';
import 'package:news_app/core/data/news_model.dart';
import 'package:news_app/view/widgets/image_widget.dart';

class ItemCardNews extends StatelessWidget {
  const ItemCardNews({super.key, required this.article});
  final Article? article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(image: article?.urlToImage ?? imageTest),
          Text(
            article?.author ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            article?.title ?? '',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Color(0xffE4E6EB)),
          ),
        ],
      ),
    );
  }
}

String imageTest = "https://picsum.photos/600/300";
