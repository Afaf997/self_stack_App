import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:self_stack/advisor/screens/navigation_screen.dart/navigation_admin.dart';
import 'package:self_stack/user/pages/authentication_screens/home_screen/home_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/domain_not_fixed.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  final int delaySeconds;

  const SplashScreen({this.delaySeconds = 3});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    checkForUpdate();
    super.initState();
    _timer = Timer(Duration(seconds: widget.delaySeconds), navigateToNextScreen);

  }
    Future<void> checkForUpdate() async {
    print('checking for Update');
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        if (info.updateAvailability == UpdateAvailability.updateAvailable) {
          print('update available');
          update();
        }
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void update() async {
    print('Updating');
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? userRoll = prefs.getString('roll');
    String? userDomain = prefs.getString('userdomain');

    if (userId != null && userId.isNotEmpty && userRoll != 'Advisor' && userDomain != 'No') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavbarScreen()),
      );
    } else if (userRoll == 'Advisor') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavbarAdmin()),
      );
    } else if (userDomain == 'No') {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/selfstack.png',
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
