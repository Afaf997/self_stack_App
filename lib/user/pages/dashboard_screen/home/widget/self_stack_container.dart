import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class BlueContainer extends StatelessWidget {
  final String heading;
  final String content;

  const BlueContainer({
    required this.heading,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: kwhiteModel,
          width: 0.7,
        ),
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: kselfstackGreen,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(color: kwhiteModel),
          ),
        ],
      ),
    );
  }
}
