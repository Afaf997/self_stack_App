import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;

  StatCard({required this.icon, required this.value,});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
       margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.042,),
      height: screenHeight * 0.19,
      decoration: BoxDecoration(
        color: kblackDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kwhiteModel,
            size: screenWidth * 0.07,
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            value,
            style: TextStyle(
              color: kwhiteModel,
              fontSize: screenHeight * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}