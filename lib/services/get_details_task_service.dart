
import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';

class getTaskDetailsServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getDetails(String taskId, String courseId) async {
    print(courseId.toString());
    try {
      String apiUrl = "$loginApi/tasks/$taskId/tasks/$courseId$apikey";

      Response response = await dio.get(apiUrl);
      print(response.data);
      if (response.statusCode == 200) {
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
