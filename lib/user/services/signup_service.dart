import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';


class SignupService {
  Dio dio = Dio();

  Future<bool> signUpModel(String name, String email, String password) async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
    };

    try {
      final response = await dio.post(
        "$loginApi/users$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    if (response.statusCode == 401) {
        String error = 'Something went wrong';
        if (response.data != null &&
            response.data['error'] == 'Invalid username or password') {
          error = 'Invalid username or password';
        }
        throw Exception(error);
      }
      return response.statusCode == 200;
    } on DioException {
      rethrow;
    }
  }
}