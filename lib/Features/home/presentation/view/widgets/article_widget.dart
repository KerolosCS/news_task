import 'package:flutter/material.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';
import 'package:news_task/Features/home/presentation/view/widgets/article_image.dart';
import 'package:news_task/Features/home/presentation/view/widgets/date_of_article.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    this.newsData,
  });
  final Article? newsData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          DataOfArticle(newsData: newsData),
          ArticleImage(newsData: newsData),
        ],
      ),
    );
  }
}
