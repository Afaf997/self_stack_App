import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/blocs/task_bloc/bloc/task_bloc.dart';
import 'package:self_stack/blocs/task_details/bloc/score_bloc.dart';
import 'package:self_stack/blocs/to_do/bloc/todo_bloc.dart';
import 'package:self_stack/firebase_options.dart';
import 'package:self_stack/pages/authentication_screens/home_screen/splash.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/repository/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future _firebaseBackgroundMessage(RemoteMessage message)async{
  if(message.notification != null){}
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseApicall().initNotification();

 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScoreBloc>(
          create: (context) => ScoreBloc(),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
        ),
       
          BlocProvider<DashBoardBloc>(
          create: (context) => DashBoardBloc(),
        ),
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(),
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
