import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/indicater.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/feedback.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/function/build_Subtitle.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/function/fetch_details.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/task_screen.dart';
import 'package:self_stack/utils/constans.dart';

class DetailOfTask extends StatelessWidget {
  final String taskId;
  final String courseId;

  DetailOfTask({Key? key, required this.taskId, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchDetailsOfTask(courseId, taskId),
      builder: (context, tasksnapshot) {
        if (tasksnapshot.connectionState == ConnectionState.done) {
          if (tasksnapshot.data != null) {
            Map<String, dynamic> taskDetails = tasksnapshot.data!;
            List<dynamic> subtitles = taskDetails['subtitle'];

            return Scaffold(
              backgroundColor: kbackgroundmodel,
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back,
                                    color: kwhiteModel),
                              ),
                              SizedBox(
                                width: 40,
                              ),
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
                            ],
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
                                    color: kselfstackGreen,
                                  ),
                                ),
                                Text(
                                  taskDetails['duration'],
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: kwhiteModel,
                                      fontWeight: FontWeight.bold),
                                ),
                                ksizedboxC,
                                Text(
                                  taskDetails['title'],
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    color: kwhiteModel,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ksizedboxX,
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
                            MaterialPageRoute(
                              builder: (context) => FeedbackScreen(
                                tasksId: taskId,
                                taskName: taskDetails['title'],
                              ),
                            ),
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
            return Center(child: Text('Task details not available'));
          }
        } else if (!tasksnapshot.hasData) {
          return buildLoadingWidget(kselfstackGreen);
        } else {
          return buildLoadingWidget(kselfstackGreen);
        }
      },
    );
  }

}
