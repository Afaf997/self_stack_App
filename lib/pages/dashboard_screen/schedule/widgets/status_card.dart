import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class TextCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double height;

  TextCard({required this.title, required this.backgroundColor, required this.height});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.0075),
      width: double.infinity,
      height: screenHeight * height,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(color: kwhiteModel, fontSize: screenHeight * 0.02),
      ),
    );
  }
}