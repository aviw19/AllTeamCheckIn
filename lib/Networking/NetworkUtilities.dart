import 'package:dio/dio.dart';
import 'package:dio_retry_fixed/dio_retry_fixed.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';


class NetworkUtilities {
  
  Future<dynamic> getRequest(String endpoint,{Map<String, dynamic>? queryParameters}) async {
    Dio dio = new Dio();
     String getUrl = CommonConstants.databaseUrl + endpoint;
     try {
      final Response response = await dio.get(getUrl,
          queryParameters: queryParameters,
          options: Options(
              extra: const RetryOptions(
                      retries: 3, retryInterval: Duration(seconds: 1))
                  .toExtra()));
      return response;
    } on DioError catch (e) {
      print(e.toString());
      return null;
    }

  }
  
}