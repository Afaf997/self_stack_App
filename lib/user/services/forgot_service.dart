import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class ForgotService {
  final Dio dio = Dio();

  Future<bool> forgotPassword(String email) async {
    var data = {
      "email": email,
    };

    try {
      final response = await dio.post(
        "$loginApi/users/forgot-password$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      log(response.statusCode.toString());
      print(response.statusCode);

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        if (response.data != null && response.data['error'] == 'Invalid password') {
          throw Exception("Invalid email. Please try again.");
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