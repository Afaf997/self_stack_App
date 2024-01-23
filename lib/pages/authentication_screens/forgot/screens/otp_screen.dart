import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/otp_bloc/bloc/otp_bloc.dart';
import 'package:self_stack/pages/authentication_screens/Forgot/screens/forgot.dart';
import 'package:self_stack/pages/authentication_screens/forgot/screens/new_password.dart';
import 'package:self_stack/utils/constans.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.emailController}) : super(key: key);
  final OtpBloc otpbloc =OtpBloc();
  
  final TextEditingController emailController;
  // final TextEditingController otpController = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpBloc, OtpState>(
      bloc: otpbloc,
      listenWhen: (previous, current) => current is OtpActionstate,
      buildWhen: (previous, current) => current is !OtpActionstate,
      listener: (context, state) {
        if(state is SuccessOtpState){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>Newpassword(emailController: emailController,)));
        }
        else if(state is  NavigateState ){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>ForgotScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text(
                    'Verification',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: whiteModel,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    'Please enter the 6-digit verification code that was sent your phone number.',
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
                    'assets/image/otp1.png',
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 50),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6,(index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 40,
                            height: 60,
                            child: TextFormField(
                              controller: otpControllers[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: whiteModel,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.3),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (value) {
                                // You can add custom logic for each field
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => otpbloc.add(OtpVerifyevent(
                    email: emailController.text,
                    otp: otpControllers.map((controller) => controller.text).join(),
                  )),
                  child: Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                      color: selfstackGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Verify",
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
                InkWell(
                  onTap: () =>otpbloc.add(Backforgotevent()) ,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: Text(
                      "Back to forgot",
                      style: TextStyle(
                          color: whiteModel, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
