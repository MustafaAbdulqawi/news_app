import 'package:dio/dio.dart';
import '../../../core/constants_methods.dart';
import '../../../core/end_point.dart';
import '../data_provider/my_dio.dart';
import '../responses/yesterday_response.dart';

class YesterdayRequest{
  Future yesterdayRequest({
    required String apiKey
  }) async{
    try{
      Response response = await MyDio.getData(
          endPoint: yesterday,
          query: {
            'api_key': apiKey,
          }
      );
      printTest('yesterdayRequestStatusCode ${response.statusCode}');
      printResponse('yesterdayResponse ${response.data}');
      return YesterdayResponse.fromJson(response.data);
    }catch(error){
      printError('yesterdayRequest $error');
    }
  }
}
