import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> postGoogleDataToAPI(Map<String, dynamic> googleUserData) async {
  try {
    String apiUrl = "$loginApi/users/loginGoogle$apikey";

    Dio dio = Dio();

    Response response = await dio.post(
      apiUrl,
      data: jsonEncode(googleUserData),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', response.data['_id']);
      prefs.setString('roll', response.data['roll']);
      prefs.setString('userdomain', response.data['domain']);

      return true;
    } else {
      return false;
    }
  } catch (error) {
    print('Dio POST Request Error: $error');
    return false;
  }
}
