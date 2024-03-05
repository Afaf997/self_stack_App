import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class TextCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double height;
  final Widget? content;

  TextCard({
    required this.title,
    required this.backgroundColor,
    required this.height,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.0075,
      ),
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
            style: TextStyle(color: kwhiteModel, fontSize: screenHeight * 0.02,fontWeight: FontWeight.bold,),
          ),
          if (content != null) content!,
        ],
      ),
    );
  }
}
