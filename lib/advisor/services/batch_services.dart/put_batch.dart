import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/user/core/links.dart';

class BatchPutService {
  Dio dio = Dio();

Future<Welcome> PutBatchData() async {
    try {
      String apiUrl = "$loginApi/users/$apikey";
      Response response = await dio.put(apiUrl);

      if (response.statusCode == 200) {
        return Welcome.fromJson(response.data);
      } else {
        throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error fetching data: $error');
      throw Exception("Error fetching data: $error");
    }
  }
}
