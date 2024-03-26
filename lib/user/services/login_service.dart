import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:self_stack/user/core/links.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginservices {
  Dio dio = Dio();

  Future<bool> authenticationModel(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };

    try {
      final response = await dio.post(
        "$loginApi/users/signin$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userId', response.data['userId'.toString()]);
        prefs.setString('roll', response.data['userRoll'].toString());
        prefs.setString('userdomain', response.data['domain'].toString());
        return true;
      } else {
        throw Exception('Login failed with status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized access.');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Server error occurred.');
      } else {
        throw Exception('An error occurred: ${e.message}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}

