import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class ReviewPostService {
  final Dio dio = Dio();

  Future<bool> PostReviewDetails(String task, DateTime startDate,String reviewer, String statusOfReview, String PendingTopics, int mark,String remarks,String studentId ) async {
    var data = {
      "taskId": task,
      "completedDte": startDate.millisecondsSinceEpoch,
      'reviewver':reviewer,
      "reviewDetails":[{"status":statusOfReview,"color":statusOfReview == 'Not attended' ? "blue" : statusOfReview == "Task Completed"? "green"
       :statusOfReview == "Not Completed" ? "orange" :statusOfReview == "Need Improvement" ? "yellow" :statusOfReview == "Review Repeat" ? "red"
       : statusOfReview == "Next Review" ? "pink" : ''}],
      "pendingTopics":PendingTopics,
      "remarks":remarks,
      "points":mark,
      "studentId":studentId
    };

    try {
      final response = await dio.post(
        "$loginApi/users/reviews$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );


      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        if (response.data != null && response.data['error']) {
          throw Exception("Invalid OTP. Please try again.");
        }
      }
      return false;
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.statusCode.toString());
      }
      throw Exception("An error occurred. Please try again later.");
    }
  }
}