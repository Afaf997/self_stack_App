import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';
import 'package:self_stack/user/response/task_model.dart';

class ReviewService {
  Dio dio = Dio();

  Future<TaskModel> ReviewfetchData(String userId) async {
    log(userId);
    try {
      String apiUrl = "$loginApi/tasks/user/$userId$apikey";
      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        log(response.data.toString());
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching data: $error");
    }
  }
}
