import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/authentication_screens/signUp/widget/signup_button.dart';
import 'package:self_stack/user/pages/authentication_screens/signUp/widget/signup_textfield.dart';
import 'package:self_stack/utils/constans.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSignUpPressed,
    required this.onLoginPressed,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSignUpPressed;
  final VoidCallback onLoginPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.04),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: kwhiteModel,
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                "assets/image/star2.png",
                width: screenWidth * 0.3,
                height: screenHeight * 0.2,
                color: kwhiteModel,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          SignUpTextField(label: 'User name', controller: nameController, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          }),
          SizedBox(height: screenHeight * 0.02),
          SignUpTextField(
            label: 'Email',
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          SignUpTextField(
            label: 'Password',
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.06),
          SignUpButton(onPressed: onSignUpPressed),
          SizedBox(height: screenHeight * 0.02),
          GestureDetector(
            onTap: onLoginPressed,
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(fontSize: screenWidth * 0.035, color: kwhiteModel),
                children: [
                  TextSpan(
                    text: "Log In",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: kselfstackGreen,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
