import 'package:self_stack/user/repository/shared_preference.dart';
import 'package:self_stack/user/response/task_model.dart';
import 'package:self_stack/advisor/services/review/get_review.dart';

class TaskServiceFunction {
  Future<List<Task>> fetchTasks() async {
    String? userId = await getUserId();
    try {
      TaskModel tasksData = await ReviewService().ReviewfetchData(userId ?? '');
      return tasksData.userTasks.expand((userTask) => userTask.tasks).toList();
    } catch (error) {
      print('Error fetching tasks: $error');
      return []; // Return an empty list if there's an error
    }
  }
}
