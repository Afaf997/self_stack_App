// ignore_for_file: unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';
import 'package:self_stack/user/repository/shared_preference.dart';
import 'package:self_stack/user/services/feedback_services.dart';
import 'package:self_stack/utils/constans.dart';

class FeedbackScreen extends StatelessWidget {
  final String tasksId;
  final String taskName;

  FeedbackScreen({Key? key, required this.tasksId, required this.taskName})
      : super(key: key);

  Future<String?> userIdFuture = getUserId();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ksizedboxX,
              Text(
                'Task Feedback...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ksizedboxC,
              Text(
                '$taskName',
                style: TextStyle(
                  color: kselfstackGreen,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FutureBuilder<String?>(
                future: userIdFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String? userId = snapshot.data;

                    return SizedBox.shrink();
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              ksizedboxX,
              SizedBox(height: 16.0),
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.white, width: 1.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: feedbackController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter your feedback...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () async {
                    String feedbackText = feedbackController.text.trim();
                    String? userId = await userIdFuture;
                    if (feedbackText.isNotEmpty && userId != null) {
                      FeedbackService.postFeedback(
                        userId: userId,
                        taskId: tasksId,
                        feedback: feedbackText,
                      );

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Success',style: TextStyle(color: kselfstackGreen)),
                          content: Text('Feedback submitted successfully!',style: TextStyle(color: kwhiteModel)),
                          backgroundColor:kblackDark,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                   feedbackController.clear();
                                },
                              child: Text('OK',style: TextStyle(color: kwhiteModel),),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Validation Error',style: TextStyle(color: kredtheme),),
                          content: Text('Please enter valid feedback.',style: TextStyle(color: kwhiteModel)),
                          backgroundColor: kblackDark,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                feedbackController.clear();

                              },
                              child: Text('OK',style: TextStyle(color: kwhiteModel),),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kselfstackGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
