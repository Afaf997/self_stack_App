import 'dart:math';

import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class Notification_Screen extends StatelessWidget {
  const Notification_Screen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kselfstackGreen,
      body: Column(
        children: [
           Padding(
                  padding: const EdgeInsets.only(top: 50, right: 190, bottom: 30),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      color: kwhiteModel,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          Expanded(
            child: Container(
              color: kbackgroundmodel,
            ),
          ),
        ],
      ),
    );
  }
}