import 'package:dio/dio.dart';
import 'package:news_app/core/end_point.dart';
import 'package:news_app/data/remote/data_provider/my_dio5.dart';
import '../../../core/constants_methods.dart';
import '../responses/six_month_response.dart';

class SixMonthRequest{
  Future sixMonthRequest({
    required String apiKey
  }) async{
    try{
      Response response = await MyDio5.getData(
          endPoint: sixMonth,
          query: {
            'api_key': apiKey,
          }
      );
      printTest('sixMonthRequestStatusCode ${response.statusCode}');
      printResponse('sixMonthResponse ${response.data}');
      return SixMonthResponse.fromJson(response.data);
    }catch(error){
      printError('lastMonthRequest $error');
    }
  }
}