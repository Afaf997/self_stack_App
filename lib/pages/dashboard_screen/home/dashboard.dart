import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/domain_decide.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);
  final NavigationBloc navigationBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;

          return FutureBuilder<Map<String, dynamic>>(
            future: fetchUserDetails(userId!),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> userDetails = userSnapshot.data!;
                if (userDetails['domain'] == 'No') {
                  return DomainDesidePage();
                }
                return BlocConsumer<NavigationBloc, NavigationState>(
                  bloc: navigationBloc,
                  buildWhen: (previous, current) =>
                      current is! NavigationInitial,
                  listener: (context, state) {
                    if (state is HomeScreenState) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StartScreen()));
                    } else if (state is TaskScreenState) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ScheduleScreen()));
                    } else if (state is ScheduleScreenState) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TaskScreen()));
                    }
                     else if (state is ProfileScreenState) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()));
                    }
                  },
                  builder: (context, state) {
                    return Scaffold(
                      backgroundColor: kbackgroundmodel,
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Name: ${userDetails['name']}',
                                style: TextStyle(color: kwhiteModel)),
                            Text('Email: ${userDetails['email']}',
                                style: TextStyle(color: kwhiteModel)),
                          ],
                        ),
                      ),
                      bottomNavigationBar: CustomBottomNavigationBar(
                          navigationBloc: navigationBloc),
                    );
                  },);
              } else {
                return Scaffold(
                  body: Container(
                    color: kbackgroundmodel,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kselfstackGreen,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return Scaffold(
            body: Container(
              color: kbackgroundmodel,
              child: Center(
                child: CircularProgressIndicator(
                  color: kselfstackGreen,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
