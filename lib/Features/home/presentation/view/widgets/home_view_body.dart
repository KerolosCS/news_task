import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';
import 'package:news_task/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:news_task/core/styles.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../details/presentation/view/details_veiw.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {

              if (state is NewsSuccess) {
                
                return const Column(
                  children: [
                    SizedBox(height: 24),
                    ArticleListVeiw(),
                  ],
                );
              } else if (state is NewsFailure) {
                return Center(
                  child: Text(state.err),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        const ShimmerWidgetLoading(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: 12,
                  ),
                );
                
              }
            },
          ),
        ),
      ],
    );
  }
}

class ShimmerWidgetLoading extends StatelessWidget {
  const ShimmerWidgetLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300] ?? Colors.white,
        highlightColor: Colors.grey[200] ?? Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    height: 20,
                    width: MediaQuery.sizeOf(context).width - 165,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    height: 20,
                    width: MediaQuery.sizeOf(context).width - 165,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    height: 20,
                    width: MediaQuery.sizeOf(context).width * .1,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
              ),
              height: 80,
              width: 120,
            )
          ],
        ));
  }
}

class ArticleListVeiw extends StatelessWidget {
  const ArticleListVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsView(data: HomeCubit.get(context).news[index]),
              ));
        },
        child: ArticleWidget(newsData: HomeCubit.get(context).news[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemCount: HomeCubit.get(context).news.length,
    );
  }
}

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
          Expanded(
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
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: 80,
              width: 120,
              imageUrl: newsData?.urlToImage ?? '',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
