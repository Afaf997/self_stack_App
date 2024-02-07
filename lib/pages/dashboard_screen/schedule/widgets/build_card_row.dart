import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class TaskStatusCard extends StatelessWidget {
  final String title;
  final String subtitle;

  TaskStatusCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: kselfstackGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: kwhiteModel, fontSize: screenHeight * 0.04, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.15),
            child: Text(
              subtitle,
              style: TextStyle(
                  color: kwhiteModel, fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}