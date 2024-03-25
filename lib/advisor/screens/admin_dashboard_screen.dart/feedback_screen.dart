import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/feedback_details.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/feedback_function.dart';
import 'package:self_stack/advisor/services/feedback/get_feedback.dart';
import 'package:self_stack/utils/constans.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  FeedBackService feedBackService = FeedBackService();
  dynamic feedbackData;

  @override
  void initState() {
    super.initState();
    FeedbackFetcher.fetchData().then((data) {
      setState(() {
        feedbackData = data;
      });
    }).catchError((error) {
      print('Error fetching feedback data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text("Feedback Fusion", style: TextStyle(color: kwhiteModel)),
        centerTitle: true,
        backgroundColor: kselfstackGreen,
        iconTheme: IconThemeData(color: kwhiteModel),
      ),
      body: SingleChildScrollView(
        child: feedbackData != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: feedbackData.map<Widget>((data) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackDetailsScreen(
                            userName: data['userId'].toString(),
                            taskHeading: data['taskId'].toString(),
                            description: data['content'].toString(),
                            date: data['date'].toString(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            data['userId'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: kselfstackGreen,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Text(
                              data['content'].toString(),
                              style:
                                  TextStyle(fontSize: 14, color: kwhiteModel),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        Divider(
                          color: kblackLight,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            : Center(
                child: Lottie.asset('assets/lottie/box.json'), 
              ),
      ),
    );
  }
}
