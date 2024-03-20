import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class TaskStatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String statusOfReview;

  TaskStatusCard({required this.title, required this.subtitle, required this.statusOfReview});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Color backgroundColor = _getBackgroundColor(statusOfReview);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kwhiteModel,
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.15),
            child: Text(
              subtitle,
              style: TextStyle(
                color: kwhiteModel,
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(String statusOfReview) {
    switch (statusOfReview) {
      case 'not attended':
        return Colors.blue;
      case 'Task Completed':
        return Colors.green;
      case 'Not Completed':
        return Colors.orange;
      case 'Need Improvement':
        return Colors.yellow;
      case 'Review Repeat':
        return Colors.red;
      case 'scheduled':
        return Color.fromARGB(255, 215, 123, 154);
      default:
        return Colors.transparent; 
    }
  }
}
