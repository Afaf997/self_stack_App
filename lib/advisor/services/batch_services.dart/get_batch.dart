import 'package:dio/dio.dart';
import 'package:self_stack/advisor/response/batch_model.dart';
import 'package:self_stack/user/core/links.dart';

class BatchService {
  Dio dio = Dio();

  Future<Welcome> fetchData() async {
    try {
      String apiUrl = "$loginApi/batch$apikey";
      Response response = await dio.get(apiUrl);

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
