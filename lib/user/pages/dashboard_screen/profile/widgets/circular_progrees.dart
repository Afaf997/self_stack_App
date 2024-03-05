import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kbackgroundmodel,
        child: Center(
          child: CircularProgressIndicator(
            color: kselfstackGreen,
          ),
        ),
      ),
    );
  }
}
