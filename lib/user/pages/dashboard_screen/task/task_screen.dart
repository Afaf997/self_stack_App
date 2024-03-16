// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/function/task_function.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/task_details.dart';
import 'package:self_stack/user/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Future<Map<String, dynamic>> _taskDetails;

  @override
  void initState() {
    super.initState();
    loadTaskDetails();
  }

Future<void> loadTaskDetails() async {
    try {
      String? userId = await getUserId();
      if (userId != null) {
        setState(() {
          _taskDetails = fetchtaskDetails(userId);
        });
      }
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _taskDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: kselfstackGreen,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          Map<String, dynamic> userDetails = snapshot.data!;
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
                          String courseId = userDetails['userTasks'][0]['_id'];
                          String taskId = userDetails['userTasks'][0]['tasks'][index]['_id'];
                          bool isStarted = index == userDetails['userData']['tasksStarted'].length -1;
                          bool isCompleted = index < userDetails['userData']['tasksStarted'].length;
    
                          String imagePath = isStarted
                              ? 'assets/image/unlock.png'
                              : (isCompleted
                                  ? 'assets/image/tick1.png'
                                  : 'assets/image/lock5.png');
    
                          Color? imageColor = isStarted
                              ? kwhiteModel
                              : (isCompleted
                                  ? null
                                  : Color.fromARGB(255, 157, 157, 157));
    
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
                                    builder: (context) => DetailOfTask(
                                        taskId: taskId, courseId: courseId),
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
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
