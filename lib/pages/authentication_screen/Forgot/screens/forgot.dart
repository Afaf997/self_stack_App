import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/forgot_bloc/bloc/forgot_bloc.dart';
import 'package:self_stack/pages/authentication_screen/Forgot/screens/otpScreen.dart';
import 'package:self_stack/pages/authentication_screen/signUp/screens/signUp.dart';
import 'package:self_stack/utils/constans.dart';

class ForgotScreen extends StatelessWidget {
      ForgotScreen({Key? key}) : super(key: key);
  final ForgotBloc forgotBloc =ForgotBloc();
 final  TextEditingController _emailcontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotBloc, ForgotState>(
      bloc: forgotBloc,
      listenWhen: (previous, current) =>current is SignUpActionState ,
      buildWhen: (previous, current) =>current is !SignUpActionState ,
      listener: (context, state) {
        if(state is BackToSignUpState){
           Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUp()));
        }
        else if(state is SuccessForgot){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>const OtpScreen()));
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
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: whiteModel,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Please enter the email address you did like your password reset information sent to',
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
                        style: TextStyle(color: whiteModel),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _emailcontroller,
                      style: const TextStyle(color: whiteModel),
                      decoration: const InputDecoration(
                        labelText: 'Enter your Email',
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
                    onTap: () => forgotBloc.add(ForgotScreenevent(email: _emailcontroller.text)),
                    child: Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selfstackGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "GET OTP",
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
                    onTap: () => forgotBloc.add(BackTosignUp()),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        "Back to sign up",
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
