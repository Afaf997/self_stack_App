
import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class DeleteFeedbackServices {
  Dio dio = Dio();

 Future DeleteFeedback(String id) async {
  try {
    String apiUrl = "$loginApi/notification/$id$apikey";

  await dio.delete(apiUrl);
  } catch (error) {
    print('Error fetching Notification details: $error');
    throw Exception("Error fetching Notification details: $error");
  }
}

}
