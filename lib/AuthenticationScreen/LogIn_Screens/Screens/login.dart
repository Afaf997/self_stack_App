import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/AuthenticationScreen/Forgot/screens/for.dart';
import 'package:self_stack/AuthenticationScreen/Forgot/screens/forgotScreen.dart';
import 'package:self_stack/AuthenticationScreen/Forgot/screens/otpScreen.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/bloc/auth_bloc.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/colors.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/reusable.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/snackbar.dart';
import 'package:self_stack/AuthenticationScreen/signUp/screens/signUp.dart';
import 'package:self_stack/FirstScreen/mainScreen.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

  final AuthBloc authbloc = AuthBloc();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!_isValidEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authbloc,
      listenWhen: (previous, current)=>current is AuthActionState,
      buildWhen: (previous, current)=> current is !AuthActionState,
      listener: (context, state) {
        if(state is ForgotActionState){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>BackgroundImageScreen()));
        }
        else if(state is SignScreenActionState){
          Navigator.push(context,MaterialPageRoute(builder:(context)=> SignUp()));
        }else if(state is LoginSuccessState){
          log("message");
          Navigator.push(context,MaterialPageRoute(builder:(context)=>const StartScreen()));
          SnackbarUtils.showSuccessSnackbar(context, 'Login successful!',subMessages: 'You have successfully signed into your account ');
        }
        else if(state is AuthErrorstate){
           SnackbarUtils.showErrorSnackbar(context, 'Login failed. Please check your credentials.', subMessage: 'Ensure your username and password are correct.');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundmodel,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40, right: 100),
                    child: Text.rich(
                      TextSpan(
                        text: "Hi, Welcome! ",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: whiteModel,
                        ),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              "assets/image/hand.png",
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(color: whiteModel),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ReusableTextField(
                    label: 'Email',
                    controller: _emailController,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'password',
                        style: TextStyle(color: whiteModel),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ReusableTextField(
                    label: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                        authbloc.add(ForgotEvent());
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: whiteModel),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      authbloc.add(Loginevent(email:_emailController.text,password: _passwordController.text));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundmodel,
                      side: BorderSide(color: whiteModel, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Container(
                      width: 300,
                      height: 61,
                      child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: whiteModel,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Divider(
                            color: whiteModel,
                            height: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: whiteModel,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Divider(
                            color: whiteModel,
                            height: 30,
                            endIndent: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                      authbloc.add(GoogleConnectEvent());
                    },
                    child: Container(
                      width: 347,
                      height: 61,
                      decoration: BoxDecoration(
                        color: whiteModel,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/image/google_pic.png",
                              width: 36,
                              height: 36,
                            ),
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                    authbloc.add(SignUpNavigationEvent());
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(fontSize: 14, color: whiteModel),
                        children: [
                          TextSpan(
                            text: "Sign Up",
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
            ),
          ),
        );
      },
    );
  }
}
