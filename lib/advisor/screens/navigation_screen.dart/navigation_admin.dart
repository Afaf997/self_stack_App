import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:self_stack/advisor/bloc/navigation/bloc/navbar_admin_bloc.dart';
import 'package:self_stack/advisor/bloc/navigation/bloc/navbar_admin_state.dart';
import 'package:self_stack/user/blocs/bloc/bottom_navigation_bar_bloc.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/home_view.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/utils/constans.dart';

class BottomNavbarAdmin extends StatelessWidget {
  const BottomNavbarAdmin({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarAdminBloc(),
      child: BlocBuilder<NavbarAdminBloc, NavbarAdminState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kbackgroundmodel,
            body: IndexedStack(
              index: (state as NavbarAdminInitial).tabIndex,
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
                      icon: Icons.batch_prediction,
                      text: 'Batch',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen,
                    ),
                    GButton(
                      icon: Icons.today_outlined,
                      text: 'Todo',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen,
                    ),
                    GButton(
                      icon: Icons.calendar_month_outlined,
                      text: 'Attendance',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen,
                    ),
                    
                    GButton(
                      icon: Icons.domain,
                      text: 'Domain',
                      iconColor: kwhiteModel,
                      textColor: kselfstackGreen,
                      iconActiveColor: kselfstackGreen,
                    ),
                  ],
                  selectedIndex: (state as NavbarAdminInitial).tabIndex,
                  onTabChange: (index) {
                    context.read<NavbarAdminBloc>().add(NavbarIndex(index)); // Replace newIndex with the actual index you want to set

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
