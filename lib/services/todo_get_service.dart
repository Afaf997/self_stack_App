import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetTodoServices {
  Dio dio = Dio();

 Future<List<TodoModel>> GetTodogetDetails() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';
    String apiUrl = "$loginApi/todo/user/public/$userId$apikey";

    Response response = await dio.get(apiUrl);
log(response.toString());
    if (response.statusCode == 200) {
      List<TodoModel> todoList = (response.data as List<dynamic>)
          .map((task) => TodoModel.fromJson(task))
          .toList();
      return todoList;
    } else {
      throw Exception("Failed to retrieve task details. Status code: ${response.statusCode}");
    }
  } catch (error) {
    print('Error fetching task details: $error');
    throw Exception("Error fetching task details: $error");
  }
}

}
