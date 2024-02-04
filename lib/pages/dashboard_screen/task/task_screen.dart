
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/dashboard.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_details.dart';
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
                    buildWhen: (previous, current) =>current is! NavigationInitial,
                    listener: (context, state) {
                      if (state is HomeScreenState) {Navigator.push(context,  MaterialPageRoute(builder: (context) => StartScreen()),);}
                       else if (state is TaskScreenState) {Navigator.push(context,  MaterialPageRoute(builder: (context) => TaskScreen()),);}
                       else if (state is ScheduleScreenState) {Navigator.push(context,  MaterialPageRoute(builder: (context) => ScheduleScreen()),);}
                       else if (state is ProfileScreenState) {Navigator.push(context,  MaterialPageRoute(builder: (context) => ProfileScreen()),);}

                    },
                    builder: (context, state) {
                      return Scaffold(
                        backgroundColor: selfstackGreen,
                        body: Padding(
                          padding: const EdgeInsets.only(top: 140),
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundmodel,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35.0),
                                topRight: Radius.circular(35.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                padding: EdgeInsets.all(17.0),
                                children: List.generate(
                                  userDetails['userTasks'][0]['tasks'].length,(index) {
                                    String taskName = userDetails['userTasks'][0]['tasks'][index]['task_name'];
                                    String courseid=userDetails['userTasks'][0]['_id'];
                                    String id=userDetails['userTasks'][0]['tasks'][index]['_id'];
                                    bool isStarted = index == userDetails['userData']['tasksStarted'].length -1;
                                    bool isCompleted = index <userDetails['userData']['tasksStarted'].length;

                                    String imagePath = isStarted? 'assets/image/unlock.png': (isCompleted? 'assets/image/tick1.png' 
                                       : 'assets/image/lock5.png');

                                    Color? imageColor = isStarted? whiteModel
                                        : (isCompleted ? null : Color.fromARGB(255, 98, 98, 98));
                                        

                                    return GestureDetector(
  onTap: () {
  if (!isCompleted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Keep going! Complete the previous tasks to unlock this one.',
          style: TextStyle(color:redtheme), 
        ),
        duration: Duration(seconds: 3),
        backgroundColor:whiteModel, 
        behavior: SnackBarBehavior.floating, 
      ),
    );
}else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailOfTask(taskId: id, courseId: courseid),
        ),
      );
    }
  },
  child: Padding(
    padding: const EdgeInsets.all(8),
    child: Card(
      color: Color.fromARGB(255, 36, 36, 36),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
        side: BorderSide(
          color: whiteModel,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Task ${index + 1}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteModel,
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          sizedboxB,
          Image.asset(
            imagePath,
            width: 40.0,
            height: 40.0,
            color: imageColor,
          ),
        ],
      ),
    ),
  ),
);

                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        bottomNavigationBar: CustomBottomNavigationBar(
                            navigationBloc: navigationBloc),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator(
                    color: selfstackGreen,
                  );
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
