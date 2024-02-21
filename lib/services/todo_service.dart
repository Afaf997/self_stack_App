
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> PostTodoDetails( String Title, String subtitle, bool ispublic) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('userId') ?? '';
      String apiUrl = "$loginApi/todo$apikey";
       

      Response response = await dio.post(apiUrl,data: jsonEncode(
        {"title":Title,
        "subtitle":subtitle,
        "ispublic":ispublic,
        "createdBy":userId}
      ),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),);
      
      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception("Failed to retrieve task details. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error fetching task details: $error');
      throw Exception("Error fetching task details: $error");
    }
  }
}


class UserDetails{
  
}