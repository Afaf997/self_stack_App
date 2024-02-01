import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/dashboard.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/services/get_task_service.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  final NavigationBloc navigationBloc = NavigationBloc();
  final getTaskservices getTaskServices = getTaskservices();

  Future<String?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<Map<String, dynamic>> _fetchUserDetails(String userId) async {
    try {
      Map<String, dynamic> userDetails =
          await this.getTaskServices.getTaskDetails(userId);
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

          if (userId != null) {
            return FutureBuilder<Map<String, dynamic>>(
              future: _fetchUserDetails(userId),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> userDetails = userSnapshot.data!;

                  return BlocConsumer<NavigationBloc, NavigationState>(
                    bloc: navigationBloc,
                    buildWhen: (previous, current) =>
                        current is! NavigationInitial,
                    listener: (context, state) {
                      if (state is HomeScreenState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartScreen()),
                        );
                      } else if (state is TaskScreenState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TaskScreen()),
                        );
                      } else if (state is ScheduleScreenState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScheduleScreen()),
                        );
                      } else if (state is ProfileScreenState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      }
                    },
                    builder: (context, state) {
  return Scaffold(
    backgroundColor: selfstackGreen,
    body: Padding(
      padding: const EdgeInsets.only(top: 130),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundmodel,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            padding: EdgeInsets.all(20.0),
            children: List.generate(
              userDetails['userTasks'][0]['tasks'].length,
              (index) {
                String taskName = userDetails['userTasks'][0]['tasks'][index]['task_name'];
                
                // Check if the task has been started
                bool isStarted = index == userDetails['userData']['tasksStarted'].length - 1;
                
                // Check if the task is completed
                bool isCompleted = index < userDetails['userData']['tasksStarted'].length;

                // Determine which image to display
                String imagePath = isStarted ? 'assets/image/lock.png' :
                                    (isCompleted ? 'assets/image/hand.png' : 'assets/image/lock1.png');

                return Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: backgroundmodel,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$taskName',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset(
                        imagePath,
                        width: 70.0,
                        height: 70.0,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ),
    bottomNavigationBar: CustomBottomNavigationBar(navigationBloc: navigationBloc),
  );
},

                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            );
          } else {
            return Scaffold(
              body: Center(
                child: Text('User not logged in'),
              ),
            );
          }
        } else {
          return CircularProgressIndicator(
            color: selfstackGreen,
          );
        }
      },
    );
  }
}
