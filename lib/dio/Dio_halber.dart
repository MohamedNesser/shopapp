import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Diohalper {
  static Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {'Content_Type': 'application/json'}));
  }

  static Future<Response> getData(
      {@required String url, @required dynamic query ,
        String lang='ar',
        String token
      }) async {
    dio.options=BaseOptions(
   headers: {
     'lang':lang,
     'Authorization':token
   }

    );

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> pustdata(
      {@required String url,
        dynamic query,
        @required dynamic data,
        String lang='ar',
        String token
      }) async {
      dio.options.headers={
        'lang':lang,
        'Authorization':token
      };

    return await dio.post(
        url,
        queryParameters: query,
        data: data
    );

  }
}
