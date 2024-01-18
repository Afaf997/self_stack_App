import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';

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

    log(response.statusCode.toString());
    log(response.data.toString());
    print(response.statusCode);

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




