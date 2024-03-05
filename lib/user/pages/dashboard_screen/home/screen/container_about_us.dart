
import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class RedContainer extends StatelessWidget {
  final String heading;
  final String content;

  const RedContainer({
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Colors.green,
              fontSize:25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(color:kwhiteModel,fontSize:18),
          ),
        ],
      ),
    );
  }
}