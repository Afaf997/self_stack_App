

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUserId() async {
  log("message");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }
