import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';

class ResetPasswordService {
  final Dio _dio = Dio();

  Future<void> submitResetRequest(String email, String newPassword) async {
    var data = {
      "email": email,
      "newPassword": newPassword,
    };

    try {
      final response = await _dio.post(
        "$loginApi/users/updatePassword$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );


      if (response.statusCode == 200) {
        // Handle success
      } else if (response.statusCode == 401) {
        if (response.data != null && response.data['error']) {
          // Handle error
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.statusCode.toString());
      }
    }
  }
}