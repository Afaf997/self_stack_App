import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class UserPutService {
  Dio dio = Dio();

Future<bool> PutUserData(notifyId,id) async {
   var data = {
      "notifyId":notifyId};
    try {
      Response response = await dio.put(
        "$loginApi/users/$id$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error fetching data: $error');
      throw Exception("Error fetching data: $error");
    }
  }
}
