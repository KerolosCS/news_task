import 'package:flutter/material.dart';
import 'package:news_task/Features/details/presentation/view/details_veiw.dart';
import 'package:news_task/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:news_task/Features/home/presentation/view/widgets/article_widget.dart';

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
