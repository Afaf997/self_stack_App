import 'package:flutter/material.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_event.dart';
import 'package:self_stack/utils/constans.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationBloc navigationBloc;

  const CustomBottomNavigationBar({required this.navigationBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavItem(Icons.home, 'Home', 0),
          buildNavItem(Icons.task, 'Schedule', 1),
          buildNavItem(Icons.schedule, 'Task', 2),
          buildNavItem(Icons.person, 'Profile', 3),
        ],
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    bool isSelected = false;

    if (navigationBloc.state is HomeScreenState && index == 0) {
      isSelected = true;
    } else if (navigationBloc.state is TaskScreenState && index == 1) {
      isSelected = true;
    } else if (navigationBloc.state is ScheduleScreenState && index == 2) {
      isSelected = true;
    } else if (navigationBloc.state is ProfileScreenState && index == 3) {
      isSelected = true;
    }

    return GestureDetector(
      onTap: () {
        handleNavigation(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? kselfstackGreen: kwhiteModel,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? kselfstackGreen: kwhiteModel,
            ),
          ),
        ],
      ),
    );
  }

  void handleNavigation(int index) {
    if (index == 0) {
      navigationBloc.add(NavigateToHomeEvent());
    } else if (index == 1) {
      navigationBloc.add(NavigateToTaskEvent());
    } else if (index == 2) {
      navigationBloc.add(NavigateToScheduleEvent());
    } else if (index == 3) {
      navigationBloc.add(NavigateToProfileEvent());
    }
  }
}
