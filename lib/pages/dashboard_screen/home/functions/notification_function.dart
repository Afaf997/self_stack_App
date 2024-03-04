import 'dart:developer';

import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/response/notification_model.dart';
import 'package:self_stack/services/notification_service.dart';

final getNotificationServices = getNotificationservices(); 

Future<Notification_model> fetchNotificationDetails() async {
  try {
    String? userId = await getUserId();
    if (userId != null) {
      Map<String, dynamic> userDetails = await getNotificationServices.getNotificationFunc(userId);
     log(userDetails.toString());
      Notification_model notificationDetails = Notification_model.fromJson(userDetails);
      log("ji");
      log(notificationDetails.toString());
      return notificationDetails;
    } else {
      throw Exception('User ID is null');
    }
  } catch (error) {
    print('Error fetching notification details: $error');
    throw Exception("Error fetching notification details: $error");
  }
}
