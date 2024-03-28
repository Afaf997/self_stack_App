import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:self_stack/advisor/bloc/dashboard/bloc/batch_bloc.dart';
import 'package:self_stack/advisor/bloc/navigation/bloc/navbar_admin_bloc.dart';
import 'package:self_stack/advisor/bloc/network/bloc/internet_bloc.dart';
import 'package:self_stack/firebase_options.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/user/blocs/task_bloc/bloc/task_bloc.dart';
import 'package:self_stack/user/blocs/task_details/bloc/score_bloc.dart';
import 'package:self_stack/user/blocs/to_do/bloc/todo_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/home_screen/splash.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/user/repository/shared_preference.dart';
import 'package:self_stack/user/response/push_notification.dart';
import 'package:self_stack/user/services/put_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message codewaa: ${message.messageId}");
}

UserPutService userPutService = UserPutService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    print(initialMessage);
    PushNotification notification = PushNotification(
      title: initialMessage.notification?.title ?? '',
      body: initialMessage.notification?.body ?? '',
      dataTitle: initialMessage.data['title'] ?? '',
      dataBody: initialMessage.data['body'] ?? '',
    );
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? callCount = prefs.getInt('callCount') ?? 0;

  if (callCount < 3) {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    String? userId = await getUserId();

    if (fcmToken != null && userId != null) {
      userPutService.PutUserData(fcmToken, userId);
      await prefs.setInt('callCount', callCount + 1);
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ScoreBloc>(
              create: (context) => ScoreBloc(),
            ),
            BlocProvider<TaskBloc>(
              create: (context) => TaskBloc(),
            ),
            BlocProvider<NavbarAdminBloc>(
              create: (context) => NavbarAdminBloc(),
            ),
            BlocProvider<DashBoardBloc>(
              create: (context) => DashBoardBloc(),
            ),
            BlocProvider<TodoBloc>(
              create: (context) => TodoBloc(),
            ),
            BlocProvider<BatchBloc>(
              create: (context) => BatchBloc(),
            ),  BlocProvider<InternetBloc>(
              create: (context) => InternetBloc(),
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
        ),
         
      ),

    );
  }
}