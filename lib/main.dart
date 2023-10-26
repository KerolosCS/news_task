import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:news_task/Features/home/presentation/view/home_view.dart';

import 'core/bloc_observer.dart';

void main(List<String> args) {
  Bloc.observer = MyBlocObserver();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchNews(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeVeiw(),
      ),
    );
  }
}
