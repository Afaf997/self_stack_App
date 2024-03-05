import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PutTodoServices {
  Dio dio = Dio();

 Future PutTodogetDetails(String id,String title, String subtitle) async {
   var data = {
      "title": title,
      "subtitle":subtitle
    };

    try {
    await dio.put(
        "$loginApi/todo/$id$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
  } catch (error) {
    print('Error fetching task details: $error');
    throw Exception("Error fetching task details: $error");
  }
}

}
