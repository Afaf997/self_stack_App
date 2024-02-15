import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

Widget buildTaskCompletionText(int num) {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Task Completed within ",
        style: TextStyle(color: kblueTheme, fontSize: 22),
        children: [
          TextSpan(
            text:num.toString(),
            style: TextStyle(color: kyellow, fontSize: 22),
          ),
          TextSpan(
            text: " Days",
            style: TextStyle(color: kblueTheme, fontSize: 22),
          ),
        ],
      ),
    ),
  );
}
