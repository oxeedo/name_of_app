import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class HttpService {
  final Dio _dio = Dio();

  Future<Response> registerUser(Map<String, dynamic>? userData, String password,
      BuildContext? context) async {
    try {
      Response response = await _dio.post(
          'https://my.api.mockaroo.com/demo_api/register', //ENDPONT URL
          //REQUEST BODY
          queryParameters: {'apikey': '314a4a00'}, //QUERY PARAMETERS
          options: Options(headers: {
            "content-type": "text/json", //HEADERS
          }));
      //returns the successful json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      return e.response!.data;
    }
  }

  Future<Response> login(
      String email, String password, BuildContext context) async {
    try {
      Response response = await _dio.post(
        'https://my.api.mockaroo.com/demo_api/login',
        data: {'email': email, 'password': password},
        queryParameters: {'apikey': '314a4a00'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }
}
