import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteTodoServices {
  Dio dio = Dio();

 Future DeleteTodogetDetails(String id) async {
  try {
    String apiUrl = "$loginApi/todo/$id$apikey";

  await dio.delete(apiUrl);
  } catch (error) {
    print('Error fetching task details: $error');
    throw Exception("Error fetching task details: $error");
  }
}

}
