import 'package:flutter/material.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_event.dart';
import 'package:self_stack/utils/constans.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationBloc navigationBloc;

  const CustomBottomNavigationBar({required this.navigationBloc});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        if (index == 0) {
          navigationBloc.add(NavigateToHomeEvent());
        } else if (index == 1) {
          navigationBloc.add(NavigateToTaskEvent());
        } else if (index == 2) {
          navigationBloc.add(NavigateToScheduleEvent());
        } else if (index == 3) {
          navigationBloc.add(NavigateToProfileEvent());
        }
      },
    );
  }
}
