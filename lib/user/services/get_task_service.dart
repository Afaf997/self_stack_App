import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class getTaskservices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getTaskDetails(String userId) async {
    try {
      String apiUrl = "$loginApi/tasks/user/$userId$apikey";

      Response response = await dio.get(apiUrl);
   
      if (response.statusCode == 200) {
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