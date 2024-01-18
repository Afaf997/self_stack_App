import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenWidth * 0.91,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: whiteModel,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(color: backgroundmodel, fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}