import 'package:flutter/material.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_details.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/services/get_task_service.dart';
import 'package:self_stack/utils/constans.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);

  final NavigationBloc navigationBloc = NavigationBloc();
  final getTaskservices getTaskService = getTaskservices();


  Future<Map<String, dynamic>> fetchUserDetails(String userId) async {
    try {
      Map<String, dynamic> userDetails = await getTaskService.getTaskDetails(userId);
      return userDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;

          if (userId != null) {
            return FutureBuilder<Map<String, dynamic>>(
              future: fetchUserDetails(userId),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> userDetails = userSnapshot.data!;

                  return Scaffold(
                    backgroundColor: kselfstackGreen,
                    body: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50, right: 190, bottom: 30),
                          child: Text(
                            'Study Tasks',
                            style: TextStyle(
                              color: kwhiteModel,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kbackgroundmodel,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35.0),
                                topRight: Radius.circular(35.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                padding: EdgeInsets.all(17.0),
                                itemCount: userDetails['userTasks'][0]['tasks'].length,
                                itemBuilder: (context, index) {
                                  String taskName = userDetails['userTasks'][0]['tasks'][index]['task_name'];
                                  String courseId = userDetails['userTasks'][0]['_id'];
                                  String taskId = userDetails['userTasks'][0]['tasks'][index]['_id'];
                                  bool isStarted = index == userDetails['userData']['tasksStarted'].length - 1;
                                  bool isCompleted = index < userDetails['userData']['tasksStarted'].length;

                                  String imagePath = isStarted
                                      ? 'assets/image/unlock.png'
                                      : (isCompleted ? 'assets/image/tick1.png' : 'assets/image/lock5.png');

                                  Color? imageColor = isStarted
                                      ? kwhiteModel
                                      : (isCompleted ? null : Color.fromARGB(255, 98, 98, 98));

                                  return GestureDetector(
                                    onTap: () {
                                      if (!isCompleted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Keep going! Complete the previous tasks to unlock this one.',
                                              style: TextStyle(color: kredtheme),
                                            ),
                                            duration: Duration(seconds: 3),
                                            backgroundColor: kblackDark,
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailOfTask(taskId: taskId, courseId: courseId),
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
                                            color: kwhiteModel,
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
                                                color: kwhiteModel,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(height: 20),
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
                      ],
                    ),
                    bottomNavigationBar: CustomBottomNavigationBar(
                      navigationBloc: navigationBloc,
                    ),
                  );
                } else {
                  return Scaffold(
                    backgroundColor: kbackgroundmodel,
                    body: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return Scaffold(
              backgroundColor: kbackgroundmodel,
              body: Center(
                child: Text('User not logged in'),
              ),
            );
          }
        } else {
          return Scaffold(
            backgroundColor: kbackgroundmodel,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
