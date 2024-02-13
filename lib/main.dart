import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/task_bloc/bloc/task_bloc.dart';
import 'package:self_stack/blocs/task_details/bloc/score_bloc.dart';
import 'package:self_stack/firebase_options.dart';
import 'package:self_stack/pages/authentication_screens/home_screen/splash.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<ScoreBloc>(
          create: (context) => ScoreBloc(),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Self Stack',
        home: SplashScreen(),
        routes: {
    '/home': (context) => BottomNavbarScreen(),
    '/task': (context) => TaskScreen(),
    '/schedule': (context) => ScheduleScreen(),
    '/profile': (context) => ProfileScreen(),
  },
      ),
    );
  }
}
