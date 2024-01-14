// import 'package:dio/dio.dart';

// class CallApi{
//    final Dio dio =Dio();
//    final String mainurl="https://seeds-backend.vercel.app/";

//  Future   
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCall extends StatelessWidget {
  const ApiCall({super.key});
    Future<List<dynamic>> fetchAPI()async{
    Dio dio =Dio();
    var response = await dio.get("https://seeds-backend.vercel.app/") ;
    print(response.data.toString());
    return response.data;//api call is ready
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}