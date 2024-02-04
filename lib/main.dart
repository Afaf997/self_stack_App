import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/blocs/details_task_bloc/bloc/task_details_bloc.dart';
import 'package:self_stack/blocs/task_bloc/bloc/task_bloc.dart';
import 'package:self_stack/firebase_options.dart';
import 'package:self_stack/pages/authentication_screens/home_screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
      
      home:MultiRepositoryProvider(
        providers: [
         BlocProvider<NavigationBloc>(
            create: (context) => NavigationBloc(),
          ),
          BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(),
          ),
           BlocProvider<TaskDetailBloc>(
               create: (context) =>TaskDetailBloc(),
          ),
        ],
        child: SplashScreen(),
      )
  
    );
  }
}
