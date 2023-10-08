import 'package:dio/dio.dart';
import 'package:news_app/core/end_point.dart';
import '../../../core/constants_methods.dart';
import '../data_provider/my_dio2.dart';
import '../responses/last_month_response.dart';

class LastMonthRequest{
  Future lastMonthRequest({
    required String apiKey
  }) async{
    try{
      Response response = await MyDio2.getData(
          endPoint: lastMonth,
          query: {
            'api_key': apiKey,
          }
      );
      printTest('lastMonthRequestStatusCode ${response.statusCode}');
      printResponse('lastMonthResponse ${response.data}');
      return LastMonthRespose.fromJson(response.data);
    }catch(error){
      printError('lastMonthRequest $error');
    }
  }
}