import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    super.key,
    required this.newsData,
  });

  final Article? newsData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 120,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: newsData?.urlToImage ?? '',
        errorWidget: (context, url, error) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
            child: const Icon(
              Icons.warning,
              color: Colors.deepOrange,
            ),
          );
        },
        imageBuilder: (context, image) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
