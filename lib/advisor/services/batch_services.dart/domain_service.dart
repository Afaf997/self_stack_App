import 'package:dio/dio.dart';
import 'package:self_stack/advisor/response/domain.dart';
import 'package:self_stack/user/core/links.dart';

class DomainService {
  Dio dio = Dio();

  Future<List<Domain>> DomainfetchData() async {
    try {
      String apiUrl = "$loginApi/tasks$apikey";
      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        List<Domain> domainList = (response.data as List).map((item) => Domain.fromJson(item)).toList();
        return domainList;
      } else {
        throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error fetching data: $error');
      throw Exception("Error fetching data: $error");
    }
  }
}
