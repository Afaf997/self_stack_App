import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class FeedbackService {
  static final Dio _dio = Dio();

  static Future<void> postFeedback({
    required String userId,
    required String taskId,
    required String feedback,
  }) async {
    try {
      String apiUrl ="$loginApi/feedback$apikey";

      Map<String, dynamic> data = {
        "userId":userId ,
        "taskId": taskId,
        "content": feedback,
      };

      await _dio.post(apiUrl, data: data);

    } catch (error) {
      // Handle errors
      log('Error posting feedback: $error');
    }
  }
}
