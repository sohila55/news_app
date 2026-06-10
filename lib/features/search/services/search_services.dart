import 'package:dio/dio.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/features/home/models/news_api_response.dart';
import 'package:news_app/features/search/models/search_body.dart';

class SearchServices {
  final aDio = Dio();

  Future<NewsApiResponse> getSearchResult(SearchBody body) async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;

      final header = {'X-Api-Key': AppConstants.apiKey};

      final response = await aDio.get(
        AppConstants.everythingEndpoint,
        queryParameters: body.toMap(),
        options: Options(headers: header),
      );

      if (response.statusCode == 200) {
        return NewsApiResponse.fromMap(response.data);
      } else {
        throw Exception(
          'Failed to load search results : ${response.statusMessage}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
