import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/models/news_api_response.dart';
import 'package:news_app/features/search/models/search_body.dart';
import 'package:news_app/features/search/services/search_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final searchServices = SearchServices();

  Future<void> getSearchResults(String keyword) async {
    emit(SearchLoading());

    try {
      final body = SearchBody(q: keyword);
      final response = await searchServices.getSearchResult(body);

      emit(SearchLoaded(articles: response.articles ?? []));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
