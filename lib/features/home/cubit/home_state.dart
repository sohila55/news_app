part of 'home_cubit.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

class TopHeadLineNewsLoading extends HomeState {
  TopHeadLineNewsLoading();
}

class TopHeadLineNewsLoaded extends HomeState {
  final List<Article>? articles;
  TopHeadLineNewsLoaded(this.articles);
}

class TopHeadLineNewsError extends HomeState {
  final String errorMessage;
  TopHeadLineNewsError({required this.errorMessage});
}

class RecommendedNewsLoading extends HomeState {
  RecommendedNewsLoading();
}

class RecommendedNewsLoaded extends HomeState {
  final List<Article>? articles;
  RecommendedNewsLoaded(this.articles);
}

class RecommendedNewsError extends HomeState {
  final String message;
  RecommendedNewsError(this.message);
}
