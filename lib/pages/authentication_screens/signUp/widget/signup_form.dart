import 'package:flutter/material.dart';
import 'package:self_stack/pages/authentication_screens/signUp/widget/signup_button.dart';
import 'package:self_stack/pages/authentication_screens/signUp/widget/signup_textfield.dart';
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: whiteModel,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                "assets/image/star2.png",
                width: 150,
                height: 150,
                color: whiteModel,
                fit: BoxFit.cover,
              ),
            ],
          ),
          sizedbox,
          SignUpTextField(label: 'User name', controller: nameController, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          }),
               sizedboxB,
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
             sizedboxB,
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
               sizedboxX,
          SignUpButton(onPressed: onSignUpPressed),
              sizedboxD,
          GestureDetector(
            onTap: onLoginPressed,
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(fontSize: 14, color: whiteModel),
                children: [
                  TextSpan(
                    text: "Log In",
                    style: TextStyle(
                      fontSize: 16,
                      color: selfstackGreen,
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