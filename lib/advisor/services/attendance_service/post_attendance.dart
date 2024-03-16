import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class AttendancePostService {
  final Dio dio = Dio();

  Future<bool> PostAttendanceDetails(String id, String status) async {
    var data = {
      "status":status ,
      "studentId":id
    };

    try {
      final response = await dio.post(
        "$loginApi/attendance/$apikey",
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