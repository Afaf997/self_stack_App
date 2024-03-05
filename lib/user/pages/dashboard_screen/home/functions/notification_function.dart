

import 'package:self_stack/user/repository/shared_preference.dart';
import 'package:self_stack/user/response/notification_model.dart';
import 'package:self_stack/user/services/notification_service.dart';

final getNotificationServices = getNotificationservices(); 

Future<Notification_model> fetchNotificationDetails() async {
  try {
    String? userId = await getUserId();
    if (userId != null) {
      Map<String, dynamic> userDetails = await getNotificationServices.getNotificationFunc(userId);
      Notification_model notificationDetails = Notification_model.fromJson(userDetails);
      return notificationDetails;
    } else {
      throw Exception('User ID is null');
    }
  } catch (error) {
    print('Error fetching notification details: $error');
    throw Exception("Error fetching notification details: $error");
  }
}
