

import 'package:self_stack/user/response/task_model.dart';
import 'package:self_stack/advisor/services/review/get_review.dart';

class TaskServiceFunction {
  Future<List<Task>> fetchTasks(String id) async {
    String? userId = id;
    try {
      TaskModel tasksData = await ReviewService().ReviewfetchData(userId);
      List<Task> allTasks = [];
      tasksData.userTasks.forEach((userTask) {
        allTasks.addAll(userTask.tasks);
      });
      return allTasks;
    } catch (error) {
      print('Error fetching tasks: $error');
      return [];
    }
  }
}
