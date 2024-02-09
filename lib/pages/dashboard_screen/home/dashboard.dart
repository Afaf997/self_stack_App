import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:self_stack/blocs/bloc/bottom_navigation_bar_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/home.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarBloc(),
      child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
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
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.music_note,
                      text: 'Musics',
                    ),
                    GButton(
                      icon: Icons.play_circle_fill_outlined,
                      text: 'videos',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'settings',
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

    
  







