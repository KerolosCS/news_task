import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task/Features/home/data/models/news_model.dart';
import 'package:news_task/Features/home/data/repos/news_repo/news_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<Article> news = [];
  NewsModel? model;
  NewsRepo newsRepo = NewsRepo();
  void fetchNews() {
    emit(NewsLoading());
    newsRepo.getNews().then(
      (value) {
        model = value;
        model?.articles?.forEach((element) {
            if (element.urlToImage != null) {
              news.add(element);
            }
          },
        );
        emit(NewsSuccess());
      },
    ).catchError((e) {
      emit(NewsFailure(e.toString()));
    });
  }
}
