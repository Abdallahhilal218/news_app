import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/image_widget.dart';
import 'package:news_app/view/widgets/item_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Details'))),
      body: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: ImageWidget(image: imageTest, height: 300),
          ),
          Text(
            'Ukraines President Zelensky to BBC: Blood money being paid for Russian oil',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of "earning their money in other peoples blood". In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (326bn) this year. There has been a growing frustration among Ukraines leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
