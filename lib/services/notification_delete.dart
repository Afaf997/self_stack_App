
import 'package:dio/dio.dart';
import 'package:self_stack/core/links.dart';

class DeleteNotificationServices {
  Dio dio = Dio();

 Future DeleteNotification(String id) async {
  try {
    String apiUrl = "$loginApi/notification/$id$apikey";

  await dio.delete(apiUrl);
  } catch (error) {
    print('Error fetching Notification details: $error');
    throw Exception("Error fetching Notification details: $error");
  }
}

}
