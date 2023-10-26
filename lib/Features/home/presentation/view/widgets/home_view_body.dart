import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:news_task/Features/home/presentation/view/widgets/article_list_view.dart';
import 'package:news_task/Features/home/presentation/view/widgets/shimmer_widget.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: BlocBuilder<HomeCubit, HomeState>(
            // buildWhen: (prev, current) => prev != current,
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

