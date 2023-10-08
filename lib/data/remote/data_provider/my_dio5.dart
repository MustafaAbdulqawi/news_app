import 'package:dio/dio.dart';

import '../../../core/constants.dart';

class MyDio5{
  static Dio? dio;
  static dioInit(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl5,
        receiveTimeout: const Duration(seconds: 30,),
        connectTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
    required String endPoint,
    Map <String , dynamic>? query,
  })async{
    return await dio!.get(
        endPoint,
        queryParameters: query
    );
  }
  static Future<Response>postData({
    required String endPoint,
    Map<String , dynamic>?query,
    Map<String , dynamic>?data,
  })async{
    dio!.options.headers = {
      "Content-Type" : "application/json"
    };
    return await dio!.post(
      endPoint ,
      queryParameters: query,
      data: data,
    );
  }
}