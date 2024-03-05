import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.35),
      child: Text(
        title,
        style: TextStyle(color: kwhiteModel, fontSize: 22),
      ),
    );
  }
}