import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/services/auth_get_service.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);
  final NavigationBloc navigationBloc = NavigationBloc();
  final getLoginservices getloginservices = getLoginservices();

  Future<String?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<Map<String, dynamic>> _fetchUserDetails(String userId) async {
    try {
      Map<String, dynamic> userDetails =
          await getloginservices.getUserDetails(userId);
      return userDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;

          return FutureBuilder<Map<String, dynamic>>(
            future: _fetchUserDetails(userId!),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> userDetails = userSnapshot.data!;
                return BlocConsumer<NavigationBloc, NavigationState>(
                  bloc: navigationBloc,
                  buildWhen: (previous, current) => current is! NavigationInitial,
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
                    } else if (state is ProfileScreenState) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()));
                    }
                  },
                  builder: (context, state) {
                    return Scaffold(
                      backgroundColor: backgroundmodel,
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Display Name: ${userDetails['name']}',style: TextStyle(color: whiteModel),),
                            Text('URI: ${userDetails['email']}',style: TextStyle(color: whiteModel),),
                            Text('URL: ${userDetails['url']}',style: TextStyle(color: whiteModel),),
                            Text('Profile: ${userDetails['profile']}',style: TextStyle(color: whiteModel),),
                          ],
                        ),
                      ),
                     bottomNavigationBar: CustomBottomNavigationBar(navigationBloc: navigationBloc),
                   );
                  },
                );
              } 
              else {
                return Scaffold(
                  body: Container(
                    color: backgroundmodel,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: selfstackGreen,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        } 
        else {
          return Scaffold(
            body: Container(
              color: backgroundmodel,
              child: Center(
                child: CircularProgressIndicator(
                  color: selfstackGreen,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}