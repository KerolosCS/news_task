part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class NewsLoading extends HomeState {}

final class NewsSuccess extends HomeState {}

final class NewsFailure extends HomeState {
  final String err;

  NewsFailure(this.err);
}
