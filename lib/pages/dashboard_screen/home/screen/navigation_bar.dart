import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:self_stack/blocs/bloc/bottom_navigation_bar_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/home_view.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/utils/constans.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarBloc(),
      child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kbackgroundmodel,
            body: IndexedStack(
              index: (state as BottomNavigationBarInitial).tabIndex,
              children: [
                HomeView(),
                TaskScreen(),
                ScheduleScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  gap: 8,
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabs: const [
                    GButton(
                      icon: Icons.home_outlined,
                      text: 'Home',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen, // Set the active color when selected
                    ),
                    GButton(
                      icon: Icons.task_alt,
                      text: 'Task',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen,
                    ),
                    GButton(
                      icon: Icons.schedule_send_outlined,
                      text: 'Schedule',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen,
                    ),
                    
                    GButton(
                      icon: Icons.person_2_outlined,
                      text: 'Person',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen,
                    ),
                  ],
                  selectedIndex: (state as BottomNavigationBarInitial).tabIndex,
                  onTabChange: (index) {
                    context.read<BottomNavigationBarBloc>().add(ChangeTabIndexEvent(index));
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
