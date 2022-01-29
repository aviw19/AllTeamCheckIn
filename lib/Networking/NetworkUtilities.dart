import 'dart:convert';

import 'package:dio/dio.dart';
//import 'package:dio_retry_fixed/dio_retry_fixed.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';


class NetworkUtilities {
  
 static Future<dynamic> getRequest(String endpoint,{Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio();
     String getUrl = CommonConstants.databaseUrl + endpoint;
     try {
      final Response response = await dio.get(getUrl,
          queryParameters: queryParameters,
          );
      return response;
    } on DioError catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<dynamic> putRequest(String endpoint, dynamic body) async {
    Dio dio = Dio();

     String getUrl = CommonConstants.databaseUrl + endpoint;
     print(getUrl);
     try {
      final Response response = await dio.put(getUrl,
          data: body,
          );
          print(response.statusCode);
      return response;
    } on DioError catch (e) {
      print(e.toString());
      return null;
    }
  }



  
}