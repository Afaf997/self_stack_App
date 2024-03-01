import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';

class OtpService {
  final Dio dio = Dio();

  Future<bool> verifyOTP(String email, String otp) async {
    var data = {
      "email": email,
      "otp": otp,
    };

    try {
      final response = await dio.post(
        "$loginApi/users/verifyOTP$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );


      if (response.statusCode == 200) {
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