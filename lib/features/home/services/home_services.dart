import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/features/home/models/top_headlines_api_response.dart';
import 'package:news_app/features/home/models/top_headlines_body.dart';
import 'package:dio/dio.dart';

class HomeServices {
  final aDio = Dio();
  Future<TopHeadlinesApiResponse> getTopHeeadLines(
    TopHeadlinesBody body,
  ) async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;

      final header = {'X-Api-Key': AppConstants.apiKey};

      final response = await aDio.get(
        AppConstants.topHeadlinesEndpoint,
        queryParameters: body.toMap(),
        options: Options(headers: header),
      );
      if (response.statusCode == 200) {
        return TopHeadlinesApiResponse.fromMap(response.data);
      } else {
        throw Exception(
          'Failed to load top headlines: ${response.statusMessage}',
        );
      }
    } catch (e) {
      /////// means that we are catching the error and then throwing it again to be handled by the caller of this function.
      ///////This allows us to log or perform any necessary actions before passing the error up the call stack.

      rethrow;
    }
  }
}
