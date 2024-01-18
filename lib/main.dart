import 'package:flutter/material.dart';
import 'package:self_stack/pages/AuthenticationScreen/HomeScreen/screen.dart/splash.dart';


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
      title: 'Flutter Demo',
      
      home: SplashScreen(),
  
    );
  }
}
