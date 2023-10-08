import 'package:dio/dio.dart';
import 'package:news_app/core/end_point.dart';
import 'package:news_app/data/remote/data_provider/my_dio4.dart';
import '../../../core/constants_methods.dart';
import '../responses/top_headlines_response.dart';

class TopHeadlinesRequest {
  Future topHeadlinesRequest({required String apiKey}) async {
    try {
      Response response = await MyDio4.getData(endPoint: topHeadlines, query: {
        'api_key': apiKey,
      });
      printTest('TopHeadlinesRequestStatusCode ${response.statusCode}');
      printResponse('TopHeadlinesResponse ${response.data}');
      return TopHeadlinesResponse.fromJson(response.data);
    } catch (error) {
      printError('TopHeadlinesRequest $error');
    }
  }
}
