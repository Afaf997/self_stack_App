import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/authentication_screens/home_screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
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
      
      home:BlocProvider(
        create: (context)=>NavigationBloc(),
        child: SplashScreen(),)
  
    );
  }
}
