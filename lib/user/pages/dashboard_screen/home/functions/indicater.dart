import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

Widget buildLoadingWidget(Color color) {
  return Scaffold(
    body: Container(
      color: kbackgroundmodel,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    ),
  );
}
