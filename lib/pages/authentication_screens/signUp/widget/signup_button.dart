import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: whiteModel,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(color: backgroundmodel, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}