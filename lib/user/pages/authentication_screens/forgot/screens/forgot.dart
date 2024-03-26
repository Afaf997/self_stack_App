import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/validation.dart';
import 'package:self_stack/user/pages/authentication_screens/forgot/screens/otp_screen.dart';
import 'package:self_stack/user/pages/authentication_screens/signUp/screens/signUp.dart';
import 'package:self_stack/utils/constans.dart';
import '../../../../blocs/forgot_bloc/bloc/forgot_bloc.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({Key? key}) : super(key: key);
  final ForgotBloc forgotBloc = ForgotBloc();
  final TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotBloc, ForgotState>(
      bloc: forgotBloc,
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      listener: (context, state) {
        if (state is BackToSignUpState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
        } else if (state is SuccessForgot) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(emailController: _emailcontroller,)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Padding(
                    padding: EdgeInsets.only(right: 110),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: kwhiteModel,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Please enter the email address you would like your password reset information sent to',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/image/images1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(color: kwhiteModel),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _emailcontroller,
                      style: TextStyle(color: kwhiteModel),
                      decoration: InputDecoration(
                        labelText: 'Enter your Email',
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
                          return 'Email is required';
                        } else if (!isValidEmail(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => forgotBloc.add(ForgotScreenevent(email: _emailcontroller.text)),
                    child: Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        color: kselfstackGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "GET OTP",
                          style: TextStyle(
                            color: kwhiteModel,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => forgotBloc.add(BackTosignUp()),
                    child: Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        "Back to sign up",
                        style: TextStyle(
                          color: kwhiteModel,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


bool isValidEmail(String email) {
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}