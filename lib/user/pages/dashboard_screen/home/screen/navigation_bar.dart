import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:self_stack/user/blocs/bloc/bottom_navigation_bar_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/home_view.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/utils/constans.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => BottomNavigationBarBloc(),
      child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          final currentIndex = (state as BottomNavigationBarInitial).tabIndex;
          return InternetConnectivitySystem(
            child: Scaffold(
              backgroundColor: kbackgroundmodel,
              body: IndexedStack(
                index: currentIndex,
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GNav(
                    gap: 5,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    duration: Duration(milliseconds: 400),
                    tabs: [
                      GButton(
                        icon: Icons.home_outlined,
                        text: 'Home',
                        iconColor: kwhiteModel,
                        textColor: kselfstackGreen,
                        iconActiveColor: kselfstackGreen,
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
                        text: 'Weeky',
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
                    selectedIndex: currentIndex,
                    onTabChange: (index) {
                      context.read<BottomNavigationBarBloc>().add(ChangeTabIndexEvent(index));
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
