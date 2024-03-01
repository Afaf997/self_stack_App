    import 'dart:developer';

import 'package:self_stack/services/week_details.dart';

final getScoreServices getTaskService = getScoreServices();

    Future<Map<String, dynamic>> fetchScoreDetails(String userId, String reviewId) async {
    try {
      Map<String, dynamic> userDetails = await getTaskService.getScoreDetails(userId,reviewId);
      return userDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }