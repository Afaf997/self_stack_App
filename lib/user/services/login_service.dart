import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginservices {
  Dio dio = Dio();

Future<bool>authenticationModel(String email, String password)async{
var data = {
    "email": email,
    "password":password,
  };
   
  try {
    final response = await dio.post(
      "$loginApi/users/signin$apikey",
      data: jsonEncode(data),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if(response.statusCode ==200){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userId', response.data['userId'.toString()]);
        prefs.setString('roll', response.data['userRoll'].toString()); }
        

   if(response.statusCode==401){

  String error = 'Something went wrong';
      if (response.data != null && response.data['error'] == 'Invalid username or password') {

        error = 'Invalid username or password';
      }
      throw Exception(error);

    }
    return response.statusCode==200;
  }on DioException {
     rethrow;
  }
}
}




