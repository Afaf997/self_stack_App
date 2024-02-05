

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUserId() async {
  log("hii");
  
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }


