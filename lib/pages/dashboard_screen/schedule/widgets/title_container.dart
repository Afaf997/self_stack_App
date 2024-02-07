import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class InfoCard extends StatelessWidget {
  final List<String> labels;
  final Color backgroundColor;

  InfoCard({required this.labels, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
        children: labels
            .map((label) => Column(
                  children: [
                    Text(
                      label,
                      style: TextStyle(color: kwhiteModel, fontSize: screenHeight * 0.025),
                    ),
                    SizedBox(height: 5),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
