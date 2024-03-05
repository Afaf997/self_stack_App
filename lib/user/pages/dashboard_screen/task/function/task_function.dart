
import 'package:self_stack/user/services/get_task_service.dart';

final getTaskservices getTaskService = getTaskservices();

    Future<Map<String, dynamic>> fetchtaskDetails(String userId) async {
    try {
      Map<String, dynamic> userDetails = await getTaskService.getTaskDetails(userId);
      return userDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }