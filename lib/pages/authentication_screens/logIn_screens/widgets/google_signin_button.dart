
import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenWidth * 0.85, 
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: whiteModel,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15), // Adjusted left padding
          child: Row(
            children: [
              Image.asset(
                "assets/image/google_pic.png",
                width: 36,
                height: 36,
              ),
              const SizedBox(width: 10), // Added some spacing
              const Text(
                "Continue With Google",
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}