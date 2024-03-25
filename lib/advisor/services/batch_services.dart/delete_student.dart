import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class DeleteStudentServices {
  Dio dio = Dio();

 Future DeleteStudentDetails(String batchId, String studentId ) async {
  try {
    String apiUrl = "$loginApi/batch/$batchId/students/$studentId$apikey";

  await dio.delete(apiUrl);
  } catch (error) {
    print('Error fetching task details: $error');
    throw Exception("Error fetching task details: $error");
  }
}

 Future RemoveStudentDetails(String studentId ) async {
  try {
    String apiUrl = "$loginApi/users/$studentId$apikey";

  await dio.delete(apiUrl);
  } catch (error) {
    print('Error fetching task details: $error');
    throw Exception("Error fetching task details: $error");
  }
}

 Future BatchRemoveDetails(String BatchId ) async {
  try {
    String apiUrl = "$loginApi/batch/batches/$BatchId$apikey";

  await dio.delete(apiUrl);
  } catch (error) {
    print('Error fetching task details: $error');
    throw Exception("Error fetching task details: $error");
  }
}

}
