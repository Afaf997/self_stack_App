
import 'package:flutter/material.dart';
import 'package:self_stack/pages/authentication_screens/home_screen/home_screen.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');

      if (userId != null && userId.isNotEmpty) {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BottomNavbarScreen()),
        );
      } else {
        Navigator.pushReplacement(context,
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