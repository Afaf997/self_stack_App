import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final double width;

  StatCard({required this.icon, required this.value, required this.width});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: screenHeight * 0.17,
      padding: EdgeInsets.all(width * 0.1),
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
            size: width * 0.2,
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            value,
            style: TextStyle(
              color: kwhiteModel,
              fontSize: width * 0.15,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
