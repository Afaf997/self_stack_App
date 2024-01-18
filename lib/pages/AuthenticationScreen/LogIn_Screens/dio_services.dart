import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:self_stack/Core/links.dart';

class Dioservices {
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

    // log(response.statusCode.toString());
    print(response.statusCode);

   if(response.statusCode==401){

  String error = 'Something went wrong';
      if (response.data != null && response.data['error'] == 'Invalid username or password') {

        error = 'Invalid username or password';
      }
      throw Exception(error);

    }
    return response.statusCode==200;


    // if (response.statusCode == 200) {
      
    //   // emit(LoginSuccessState());
    // } else if (response.statusCode == 401) {
    //   if (response.data != null && response.data['error'] == 'Invalid username or password') {
    //     // emit(AuthState.error("Invalid username or password. Please try again."));
    //   } else {
    //     // emit(AuthState.error("Login failed. Check your credentials."));
    //   }
    // }
  }on DioException {
     rethrow;
  }

}
}




