

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }


  // child: GestureDetector(
//     onTap: () async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.clear();
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     },