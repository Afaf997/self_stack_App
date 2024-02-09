import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class StartScreenBody extends StatelessWidget {
  final Map<String, dynamic> userDetails;

  const StartScreenBody({required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: ${userDetails['name']}', style: TextStyle(color: kwhiteModel)),
          Text('Email: ${userDetails['email']}', style: TextStyle(color: kwhiteModel)),
        ],
      ),
    );
  }
}
