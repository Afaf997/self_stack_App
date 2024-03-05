import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class getAboutUsServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getAboutUsDetails() async {
    try {
      String apiUrl = "$loginApi/about$apikey";

      Response response = await dio.get(apiUrl);
   
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to retrieve user details. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching user details: $error");
    }
  }
}