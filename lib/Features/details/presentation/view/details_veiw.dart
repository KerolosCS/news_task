import 'package:flutter/material.dart';
import 'package:news_task/Features/details/presentation/view/widgets/details_view_body.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, this.data});
  final Article? data;
  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DetailsViewBody(data: data),
    );
  }
}
