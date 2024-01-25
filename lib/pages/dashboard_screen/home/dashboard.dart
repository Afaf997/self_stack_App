import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../blocs/bottom_navigation/bloc/navigation_event.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);
  final NavigationBloc navigationBloc=NavigationBloc();

  Future<String?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;
          return BlocConsumer<NavigationBloc, NavigationState>(
            bloc:navigationBloc ,
            buildWhen: (previous, current) => current is! NavigationInitial  ,
            listener: (context, state) {
              if(state is HomeScreenState){
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>StartScreen()));
              }else if(state is TaskScreenState ){
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>ScheduleScreen()));

              }else if(state is ScheduleScreenState){
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>TaskScreen()));

              }else if(state is ProfileScreenState){
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>ProfileScreen()));

              }
               
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: backgroundmodel,
                appBar: AppBar(
                  backgroundColor: selfstackGreen,
                  title: Text(
                    'App Title',
                    style: TextStyle(color: whiteModel),
                  ),
                ),
                body: Center(
                  child: Text(
                    'User ID: $userId',
                    style: TextStyle(color: whiteModel),
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.task),
                      label: 'Task',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.schedule),
                      label: 'Schedule',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: 0,
                  selectedItemColor: selfstackGreen,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.black,
                  onTap: (index) {
                    if(index ==0){
                        navigationBloc.add(NavigateToHomeEvent());
                    }else if (index == 1) {
                       navigationBloc.add(NavigateToTaskEvent());
                    } else if (index == 2) {
                       navigationBloc.add(NavigateToScheduleEvent());
                    } else if (index == 3) {
                      navigationBloc.add(NavigateToProfileEvent());
                    }
                  },
                ),
              );
            },
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
