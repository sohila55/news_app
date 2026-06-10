part of 'search_cubit.dart';

class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchInitial {
  SearchLoading();
}

final class SearchLoaded extends SearchInitial {
  final List<Article> articles;
  SearchLoaded({required this.articles});
}

final class SearchError extends SearchInitial {
  final String error;
  SearchError(this.error);
}
