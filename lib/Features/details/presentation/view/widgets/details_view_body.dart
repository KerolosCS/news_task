import 'package:flutter/material.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';
import 'package:news_task/core/styles.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, this.data});

  final Article? data;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                ArticleImage(newsData: data),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * .38,
                  child: ArticleDetails(newsData: data),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({
    super.key,
    this.newsData,
  });
  final Article? newsData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      
      decoration: BoxDecoration(
        // color: Colors.amber,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newsData?.title ?? '',
            style: Styles.font32,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 12,
              ),
              const SizedBox(width: 8),
              Text(
                newsData?.author ?? 'Harry Harper ',
                style: Styles.font12,
              ),
              const SizedBox(width: 8),
              Text(
                '${newsData?.publishedAt}',
                style: Styles.font12,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            newsData?.content ?? '',
            style: Styles.font16,
          ),
        ],
      ),
    );
  }
}

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    super.key,
    this.newsData,
  });
  final Article? newsData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .4,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(newsData?.urlToImage ?? ''),
        ),
      ),
    );
  }
}
