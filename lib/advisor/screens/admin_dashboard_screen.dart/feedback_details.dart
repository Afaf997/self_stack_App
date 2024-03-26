import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class FeedbackDetailsScreen extends StatelessWidget {
  final String userName;
  final String taskHeading;
  final String description;
  final String date;

  const FeedbackDetailsScreen({
    Key? key,
    required this.taskHeading,
    required this.description,
    required this.date,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        backgroundColor: kselfstackGreen,
        iconTheme: IconThemeData(color: kwhiteModel),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Spacer(), // Add Spacer widget
                  Text(
                    date.split('T')[0],
                    style: TextStyle(fontSize: 13, color: kyellow),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                taskHeading,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kselfstackGreen,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '$description',
                style: TextStyle(fontSize: 16, color: kwhiteModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
