import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_event.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            buildWhen: (previous, current) => current is !navigateActionState  ,
            listenWhen: (previous, current) =>current is navigateActionState  ,
            listener: (context, state) {
              if(state is HomeScreenState){
                
              }
               
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: backgroundmodel,
                appBar: AppBar(
                  backgroundColor: selfstackGreen,
                  title: Text(
                    'Your App Title',
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
                  onTap: (index) {},
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
