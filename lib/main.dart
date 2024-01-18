import 'package:flutter/material.dart';
import 'package:self_stack/pages/authentication_screens/home_screen/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins",),darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Self Stack',
      
      home: SplashScreen(),
  
    );
  }
}
