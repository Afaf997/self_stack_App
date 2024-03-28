import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

Widget buildLoadingWidget(Color color) {
  return Scaffold(
    backgroundColor: Colors.black, 
    body: Container(
      color: kbackgroundmodel,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: kbackgroundmodel,
          color: color,
        ),
      ),
    ),
  );
}
