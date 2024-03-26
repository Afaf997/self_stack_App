import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/user/core/links.dart';

class BatchService {
  Dio dio = Dio();

  Future<Welcome> fetchData() async {
    try {
      String apiUrl = "$loginApi/batch$apikey";
      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        return Welcome.fromJson(response.data);
      } else {
        throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error fetching rtgdata: $error');
      throw Exception("Error fetching data: $error");
    }
  }
Future<dynamic> GetAttendancfetchData() async {
  try {
    String apiUrl = "$loginApi/batchwise$apikey";
    Response response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      // Return the response data directly
      return response.data;
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
}
