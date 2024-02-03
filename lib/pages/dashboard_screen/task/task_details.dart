import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/pages/dashboard_screen/task/function/box_task.dart';
import 'package:self_stack/services/get_details_task_service.dart';
import 'package:self_stack/utils/constans.dart';

class DetailOfTask extends StatelessWidget {
  final String taskId;
  final String courseId;
  DetailOfTask({Key? key, required this.taskId, required this.courseId});

  final getTaskDetailsServices getTaskDetailsservices= getTaskDetailsServices();

  Future<Map<String, dynamic>> _fetchTaskDetails(String taskId, String courseId) async {
    try {
      Map<String, dynamic> userTaskDetails =
          await getTaskDetailsservices.getDetails(taskId, courseId);
      return userTaskDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchTaskDetails(courseId, taskId),
      builder: (context, tasksnapshot) {
        if (tasksnapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> taskDetails = tasksnapshot.data!;

          return Scaffold(
            backgroundColor: backgroundmodel,
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 250.0,
                      height: 200.0,
                      child: Lottie.asset(
                        'assets/lottie/task.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          taskDetails['task_name'],
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: selfstackGreen,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                                taskDetails['duration'],
                          style: TextStyle(fontSize: 16.0, color: whiteModel),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  buildSubtitle('Subtitle 1', [
                    'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                    'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                    'Lorem ipsum in the graphic, print, and publishing industries for previewing layouts and visual mockups.'
                  ]),
                  buildSubtitle('- Subtitle 1 :', ['Point 1', 'Point 2', 'Point 3']),
                  buildSubtitle('Subtitle 3', ['Point 1', 'Point 2', 'Point 3']),
                ],
              ),
            ),
          );
        } else if (!tasksnapshot.hasData) {
          return Center(
            child: Text('No user data available'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
