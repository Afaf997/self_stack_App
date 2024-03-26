import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/forgot/screens/otp_screen.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/utils/constans.dart';
import '../../../../blocs/reset_bloc.dart/bloc/reset_password_bloc.dart';

class Newpassword extends StatelessWidget {
  Newpassword({Key? key, required this.emailController}) : super(key: key);

  final ResetPasswordBloc resetbloc = ResetPasswordBloc();
  final TextEditingController emailController;
  final TextEditingController resetpasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      bloc: resetbloc,
      listenWhen: (previous, current) => current is ResetActionstate,
      buildWhen: (previous, current) => current is! ResetActionstate,
      listener: (context, state) {
        if (state is ResetNavigateState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(emailController: emailController)));
        } else if (state is SuccessResetState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const Padding(
                      padding: EdgeInsets.only(right: 110),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: kwhiteModel,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/image/lock.png',
                        height: 270,
                        width: 270,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New password',
                          style: TextStyle(color: kwhiteModel),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        controller: resetpasswordController,
                        style: const TextStyle(color: kwhiteModel),
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                          labelStyle: TextStyle(color: kgreymodel),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(color: kwhiteModel),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(color: kgreymodel),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your new password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirm password',
                          style: TextStyle(color: kwhiteModel),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        controller: confirmPasswordController,
                        style: const TextStyle(color: kwhiteModel),
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: kgreymodel),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(color: kwhiteModel),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(color: kgreymodel),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != resetpasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          resetbloc.add(Submitevent(
                              email: emailController.text,
                              newpassword: resetpasswordController.text));
                        }
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kselfstackGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: kwhiteModel,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => resetbloc.add(BackToOtp()),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 230),
                        child: Text(
                          "Back to verification",
                          style: TextStyle(
                              color: kwhiteModel, fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
