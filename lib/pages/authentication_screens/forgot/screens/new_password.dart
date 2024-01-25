import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/reset_bloc.dart/bloc/reset_password_bloc.dart';
import 'package:self_stack/pages/authentication_screens/forgot/screens/otp_Screen.dart';
import 'package:self_stack/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/utils/constans.dart';

class Newpassword extends StatelessWidget {
  Newpassword({super.key, required this.emailController,});
  final ResetPasswordBloc resetbloc =ResetPasswordBloc();
    final TextEditingController emailController;
    final TextEditingController resetpassword =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc,ResetPasswordState>(
      bloc: resetbloc,
      listenWhen: (previous, current) =>current is ResetActionstate  ,
      buildWhen: (previous, current) =>current is !ResetActionstate   ,
      listener: (context, state) {
        if(state is ResetNavigateState){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpScreen(emailController: emailController,)));
        }
         else if(state is SuccessResetState ){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));
         }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
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
                        color: whiteModel,
                      ),
                    ),
                  ),
                  // SizedBox(height: 30),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/image/lock.png',
                      height: 270,
                      width: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // sizedboxC,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New password',
                        style: TextStyle(color: whiteModel),
                      ),
                    ),
                  ),
                  sizedboxA,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller:resetpassword,
                      style: const TextStyle(color: whiteModel),
                      decoration: const InputDecoration(
                        // labelText: 'Enter your Email',
                        labelStyle: TextStyle(color: greymodel),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(color: whiteModel),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(color: greymodel),
                        ),
                      ),
                    ),
                  ),
                  sizedboxD,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirm password',
                        style: TextStyle(color: whiteModel),
                      ),
                    ),
                  ),
                  sizedbox,
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      // controller:resetpassword,
                      style: const TextStyle(color: whiteModel),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: greymodel),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(color: whiteModel),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(color: greymodel),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => resetbloc.add(Submitevent(email: emailController.text,newpassword:resetpassword.text )),
                    child: Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selfstackGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: whiteModel,
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
                        "Back to varification",
                        style: TextStyle(
                            color: whiteModel, fontWeight: FontWeight.w400),
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
