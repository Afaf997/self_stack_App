import 'package:flutter/material.dart';
import 'package:self_stack/pages/authentication_screens/home_screen/home_screen.dart';
import 'package:self_stack/utils/constans.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor:  backgroundmodel,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/selfstack.png',
                
                width:screenWidth*0.91,
                height: screenHeight*0.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}