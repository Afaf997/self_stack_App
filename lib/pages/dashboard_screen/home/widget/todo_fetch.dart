
  
  import 'package:self_stack/response/todo_model.dart';
import 'package:self_stack/services/get_details_task_service.dart';
import 'package:self_stack/services/todo_get_service.dart';


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

