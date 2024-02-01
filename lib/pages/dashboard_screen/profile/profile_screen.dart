import 'package:flutter/material.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/authentication_screens/LogIn_Screens/Screens/login.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
 ProfileScreen({super.key});
 final NavigationBloc navigationBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundmodel,
      body: Center(
        child: GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          },
          child: Text(
            "Logout",
            style: TextStyle(color: redtheme,fontSize: 24),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(navigationBloc: navigationBloc),
    );
  }
}