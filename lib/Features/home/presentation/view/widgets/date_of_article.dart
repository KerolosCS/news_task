import 'package:flutter/material.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';
import 'package:news_task/core/styles.dart';

class DataOfArticle extends StatelessWidget {
  const DataOfArticle({
    super.key,
    required this.newsData,
  });

  final Article? newsData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsData?.title ?? 'How to Setup Your Worksapce',
              style: Styles.font18,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              newsData?.author ?? 'Interior',
              style: Styles.font12,
            ),
          ],
        ),
      ),
    );
  }
}
