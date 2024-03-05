


import 'package:self_stack/user/response/todo_model.dart';
import 'package:self_stack/user/services/todo_get_service.dart';

final GetTodoServices getTaskDetailsService = GetTodoServices();

  Future<Future<List<TodoModel>>> fetchTodoList() async {
    try {
      Future<List<TodoModel>> userTaskDetails =  getTaskDetailsService.GetTodogetDetails();
      return userTaskDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }

