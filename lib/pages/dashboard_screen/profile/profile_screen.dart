import 'package:flutter/material.dart';
import 'package:self_stack/pages/authentication_screens/LogIn_Screens/Screens/login.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundmodel,
      body: Center(
        child: GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          },
          child: Text(
            "Logout",
            style: TextStyle(color: redtheme,fontSize: 24),
          ),
        ),
      ),
    );
  }
}