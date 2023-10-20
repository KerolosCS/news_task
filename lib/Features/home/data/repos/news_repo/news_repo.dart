import 'package:dio/dio.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';
import 'package:news_task/core/api_service.dart';

class NewsRepo {
  ApiService api = ApiService(Dio());

  Future<NewsModel> getNews() async {
    var res = await api.get();
    NewsModel newsModel = NewsModel.fromJson(res);
    return newsModel;
  }
}
