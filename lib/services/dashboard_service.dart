

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';

class getLoginservices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getUserDetails(String userId) async {
    try {
      String apiUrl = "$loginApi/users/$userId$apikey";

      Response response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
       log(response.toString());
        return response.data;
      } else {
        throw Exception("Failed to retrieve user details. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error fetchi ang user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }
}