import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:self_stack/advisor/bloc/navigation/bloc/navbar_admin_bloc.dart';
import 'package:self_stack/advisor/bloc/navigation/bloc/navbar_admin_state.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/batch.dart';
import 'package:self_stack/advisor/screens/domain_screen.dart/domain_students.dart';
import 'package:self_stack/advisor/screens/profile_screen.dart/profile_admin.dart';
import 'package:self_stack/advisor/screens/todo_screen.dart/admin_todo.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';
import 'package:self_stack/utils/constans.dart';

class BottomNavbarAdmin extends StatelessWidget {
  const BottomNavbarAdmin({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarAdminBloc(),
      child: BlocBuilder<NavbarAdminBloc, NavbarAdminState>(
        builder: (context, state) {
          final currentIndex = (state as NavbarAdminInitial).tabIndex;
          return InternetConnectivitySystem(
            child: Scaffold(
              backgroundColor: kbackgroundmodel,
              body: IndexedStack(
                index: currentIndex,
                children: [
                  BatchScreen(),
                  TodoAdmin(),           
                  DomainPage(),
                  AdvisorProfile(),
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
                        icon: Icons.domain,
                        text: 'Domain',
                        iconColor: kwhiteModel,
                        textColor: kselfstackGreen,
                        iconActiveColor: kselfstackGreen,
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                        iconColor: kwhiteModel,
                        textColor: kselfstackGreen,
                        iconActiveColor: kselfstackGreen,
                      ),
                    ],
                    selectedIndex: currentIndex,
                    onTabChange: (index) {
                      context.read<NavbarAdminBloc>().add(NavbarIndex(index));
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