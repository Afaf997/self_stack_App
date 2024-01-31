
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';

Future<bool> postGoogleDataToAPI(Map<String, dynamic> googleUserData) async {
  try {
    String apiUrl = "$loginApi/users/loginGoogle$apikey";

    Dio dio = Dio();

    
    print("object");
    print(googleUserData.toString());
    Response response = await dio.post(apiUrl, data: jsonEncode(googleUserData),options: Options(
        headers: {'Content-Type': 'application/json'},
      ));

    if (response.statusCode == 200) {
        log(response.data['name'.toString()]);
      return true;
    } else {
      return false;
    }
  } catch (error) {
    print('Dio POST Request Error: $error');
    return false;
  }
}

