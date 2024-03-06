import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class BatchPostService {
  final Dio dio = Dio();

  Future<bool> PostBatchDetails(String name, DateTime startDate) async {
    var data = {
      "name": name,
      "startDate": startDate.millisecondsSinceEpoch,
    };

    try {
      final response = await dio.post(
        "$loginApi/batch$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );


      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        if (response.data != null && response.data['error']) {
          throw Exception("Invalid OTP. Please try again.");
        }
      }
      return false;
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.statusCode.toString());
      }
      throw Exception("An error occurred. Please try again later.");
    }
  }
}