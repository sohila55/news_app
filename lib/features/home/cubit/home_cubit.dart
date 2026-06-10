import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/models/news_api_response.dart';
import 'package:news_app/features/home/models/top_headlines_body.dart';
import 'package:news_app/features/home/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeServices _homeServices = HomeServices();

  Future<void> getTopHeadLinesData() async {
    emit(TopHeadLineNewsLoading());
    try {
      final topHeadlinesResponse = TopHeadlinesBody(
        category: 'technology',
        country: 'us',
        pageSize: 10,
        page: 1,
      );

      final result = await _homeServices.getTopHeeadLines(topHeadlinesResponse);
      emit(TopHeadLineNewsLoaded(result.articles));
    } catch (e) {
      emit(TopHeadLineNewsError(errorMessage: e.toString()));
    }
  }

  Future<void> recommendationNewsData() async {
    emit(RecommendedNewsLoading());
    try {
      final body = TopHeadlinesBody(pageSize: 20, page: 1);
      final result = await _homeServices.getTopHeeadLines(body);

      emit(RecommendedNewsLoaded(result.articles));
    } catch (e) {
      emit(RecommendedNewsError(e.toString()));
    }
  }
}
