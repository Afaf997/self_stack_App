import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/user/core/links.dart';

class BatchPutService {
  Dio dio = Dio();

Future<Welcome> PutBatchData(id,name,age,dateOfBirth,email,gender,place,address,guardianName,educationQualification,phoneNumber,domain,batch) async {
   var data = {
      "name": name,
      "age":age,
      "dateOfBirth":dateOfBirth,
      "email":email,
       "gender":gender,
       "place":place,
       "address":address,
       "guardian":guardianName,
       "phone":phoneNumber,
       "educationQualification":educationQualification,
       "domain":domain,
       "batch":batch
    };
    try {
      Response response = await dio.put(
        "$loginApi/users/$id$apikey",
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

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
