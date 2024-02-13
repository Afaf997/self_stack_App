
  
  import 'package:self_stack/services/get_details_task_service.dart';

final getTaskDetailsServices getTaskDetailsService = getTaskDetailsServices();
  Future<Map<String, dynamic>> fetchDetailsOfTask(
      String taskId, String courseId) async {
    try {
      Map<String, dynamic> userTaskDetails =
          await getTaskDetailsService.getDetails(taskId, courseId);
      return userTaskDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }