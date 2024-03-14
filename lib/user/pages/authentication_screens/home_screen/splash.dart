import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/navigation_screen.dart/navigation_admin.dart';
import 'package:self_stack/user/pages/authentication_screens/home_screen/home_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/domain_not_fixed.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  final int delaySeconds;

  SplashScreen({this.delaySeconds = 3});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(Duration(seconds: delaySeconds), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      String? userRoll = prefs.getString('roll');
      String? userDomain = prefs.getString('userdomain');

      if (userId != null && userId.isNotEmpty && userRoll != 'Advisor' && userDomain!='No') {
        log(userDomain.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavbarScreen()),
        );
      } else if (userRoll == 'Advisor') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavbarAdmin()),
        );
      }
      else if (userDomain == 'No') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DomainDesidePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });

    return Scaffold(
      backgroundColor: kbackgroundmodel,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/selfstack.png',
                width: screenWidth * 0.90,
                height: screenHeight * 0.6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
