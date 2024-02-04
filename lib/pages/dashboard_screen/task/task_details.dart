import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/pages/dashboard_screen/task/feedback.dart';
import 'package:self_stack/pages/dashboard_screen/task/function/box_task.dart';
import 'package:self_stack/services/get_details_task_service.dart';
import 'package:self_stack/utils/constans.dart';

class DetailOfTask extends StatelessWidget {
  final String taskId;
  final String courseId;

  DetailOfTask({Key? key, required this.taskId, required this.courseId});

  final getTaskDetailsServices getTaskDetailsService = getTaskDetailsServices();

  Future<Map<String, dynamic>> _fetchTaskDetails(
      String taskId, String courseId) async {
    try {
      Map<String, dynamic> userTaskDetails =
          await getTaskDetailsService.getDetails(taskId, courseId);
      return userTaskDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }

Widget buildSubtitle(String title, List<String> points) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: whiteModel,
        ),
      ),
      SizedBox(height: 8.0),
      Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 36, 36, 36),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var point in points)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '\u2022',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(width: 9.0),
                      Flexible(
                        child: Text(
                          point,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0), 
                ],
              ),
          ],
        ),
      ),
      SizedBox(height:20),
    ],
  );
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchTaskDetails(courseId, taskId),
      builder: (context, tasksnapshot) {
        if (tasksnapshot.connectionState == ConnectionState.done) {
          if (tasksnapshot.data != null) {
            Map<String, dynamic> taskDetails = tasksnapshot.data!;
            List<dynamic> subtitles = taskDetails['subtitle'];

            return Scaffold(
              backgroundColor: backgroundmodel,
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
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
                          SizedBox(height: 26.0),
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
                                Text(
                                  taskDetails['duration'],
                                  style: TextStyle(fontSize: 16.0, color: whiteModel),
                                ),
                              ],
                            ),
                          ),
                          sizedboxX,
                          for (var subtitle in subtitles)
                            buildSubtitle(
                              subtitle['subtitle_name'],
                              List<String>.from(subtitle['points']),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeedbackPage()),
                          );
                        },
                        child: Image.asset(
                          'assets/image/feedback.png',
                          width: 70.0,
                          height: 70.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Task details not available'),
            );
          }
        } else if (!tasksnapshot.hasData) {
         return CircularProgressIndicator();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
