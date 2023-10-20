import 'package:flutter/material.dart';
import 'package:news_task/Features/home/presentation/view/widgets/home_view_body.dart';
import 'package:news_task/core/constants.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: const HomeViewBody(),
    );
  }
}
