

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class getLoginservices {
  Dio dio = Dio();

  
  Future<Map<String, dynamic>> getUserDetails(String userId) async {
    try {
      String apiUrl = "$loginApi/users/$userId$apikey";

      Response response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
  return response.data;
} else if (response.statusCode == 404) {
  print("User not found");
  return {}; 
} else {
  
  throw Exception("Failed to retrieve user details. Status code: ${response.statusCode}");
  
}

    }
     catch (error) {
      return Future.error(error);
    }
  }
}