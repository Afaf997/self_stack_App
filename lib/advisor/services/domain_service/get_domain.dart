import 'package:dio/dio.dart';
import 'package:self_stack/user/core/links.dart';

class DomainStudentService {
  Dio dio = Dio();

  Future<dynamic> DomainStudentData() async {
    try {
      String apiUrl = "$loginApi/tasks$apikey";
      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error fetching student data: $error');
      throw Exception("Error fetching student data: $error");
    }
  }
}
