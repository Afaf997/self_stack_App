import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/forgot/screens/forgot.dart';
import 'package:self_stack/user/pages/authentication_screens/home_screen/splash.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/widgets/reusable.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/widgets/snackbar.dart';
import 'package:self_stack/user/repository/firebase_auth_repository.dart';
import 'package:self_stack/user/services/google_signup_service.dart';
import 'package:self_stack/utils/constans.dart';
import '../../../../blocs/login_bloc/bloc/auth_bloc.dart';
import '../../signUp/screens/signUp.dart';

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
  } else if (!_containsOnlyLowerCaseLetters(value)) {
    return 'Email should only contain lowercase letters';
  }
  return null;
}

bool _containsOnlyLowerCaseLetters(String value) {
  return RegExp(r'^[a-z]+$').hasMatch(value);
}

bool _isValidEmail(String value) {
  return RegExp(r'^[\w-]+(\.[\w-]+)*@([a-z\d-]+\.)+[a-z]{2,}$').hasMatch(value);
}

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authbloc,
      listenWhen: (previous, current) => current is AuthActionState,
      buildWhen: (previous, current) => current is! AuthActionState,
      listener: (context, state) {

        if (state is ForgotActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotScreen()),
          );
        } else if (state is SignScreenActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SplashScreen(delaySeconds: 0)),
          );
          SnackbarUtils.showSuccessSnackbar(
            context,
            'Login successful!',
            subMessages: 'You have successfully signed into your account ',
          );
        } else if (state is StatusCodeErrorState) {
          SnackbarUtils.showErrorSnackbar(context,
          "Login Failed",
          subMessage: "Your email or password is wrong"
           );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kbackgroundmodel,
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
                        color: kwhiteModel,
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
                      style: TextStyle(color: kwhiteModel),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ReusableTextField(
                 label: 'Email',
                 controller: _emailController,
                 validator: validateEmail, 
               ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'password',
                      style: TextStyle(color: kwhiteModel),
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
                validator: validatePassword, 
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
                        style: TextStyle(color: kwhiteModel),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    authbloc.add(Loginevent(
                        email: _emailController.text,
                        password: _passwordController.text));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kbackgroundmodel,
                    side: BorderSide(color: kwhiteModel, width: 1),
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
                          color: kwhiteModel,
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
                          color: kwhiteModel,
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
                          color: kwhiteModel,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Divider(
                          color: kwhiteModel,
                          height: 30,
                          endIndent: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () async {
                    UserCredential userCredential =
                        await FirebaseServices().signInWithGoogle();
                    // ignore: unnecessary_null_comparison
                    if (userCredential != null) {
                      Map<String, dynamic> googleUserData = {
                        'googleId': userCredential.user?.uid,
                        'email': userCredential.user?.email,
                        'name': userCredential.user?.displayName,
                        'image': userCredential.user?.photoURL,
                      };

                      try {
                         await postGoogleDataToAPI(googleUserData);
                      } catch (e) {
                        log(e.toString());
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen(delaySeconds:0)));
                    } else {}
                  },
                  child: Container(
                    width: 347,
                    height: 61,
                    decoration: BoxDecoration(
                      color: kwhiteModel,
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
                              color:kbackgroundmodel,
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
                      style: TextStyle(fontSize: 14, color: kwhiteModel),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: kselfstackGreen,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
