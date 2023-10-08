import 'package:dio/dio.dart';
import 'package:news_app/core/end_point.dart';
import 'package:news_app/data/remote/data_provider/my_dio3.dart';
import '../../../core/constants_methods.dart';
import '../responses/us_right_response.dart';

class UsRightRequest {
  Future usRightRequest({required String apiKey}) async {
    try {
      Response response = await MyDio3.getData(endPoint: usRight, query: {
        'api_key': apiKey,
      });
      printTest('usRightRequestStatusCode ${response.statusCode}');
      printResponse('usRightResponse ${response.data}');
      return UsRightResponse.fromJson(response.data);
    } catch (error) {
      printError('usRightRequest $error');
    }
  }
}
