import 'package:dio/dio.dart';
import 'package:self_stack/advisor/response/batches_model.dart';
import 'package:self_stack/user/core/links.dart';

class DomainService {
  Dio dio = Dio();

  Future<List<Domainbatch>> DomainfetchData() async {
    try {
      String apiUrl = "$loginApi/tasks$apikey";
      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        // Assuming the response is a list of Domainbatch
        List<Domainbatch> domainList = (response.data as List).map((item) => Domainbatch.fromJson(item)).toList();
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
