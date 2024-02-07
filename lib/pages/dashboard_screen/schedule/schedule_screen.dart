import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/dashboard.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});
  final NavigationBloc navigationBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      bloc: navigationBloc,
      buildWhen: (previous, current) => current is! NavigationInitial,
      listener: (context, state) {
        if (state is HomeScreenState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StartScreen()),
          );
        } else if (state is TaskScreenState) {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScheduleScreen()),
          );
        } else if (state is ScheduleScreenState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskScreen()),
          );
        } else if (state is ProfileScreenState) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ProfileScreen()),
          // );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text("schedule page"),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(navigationBloc: navigationBloc),
        );
      },
    );
  }
}