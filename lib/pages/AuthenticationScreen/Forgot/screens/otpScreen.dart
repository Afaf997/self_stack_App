import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:pinput/pinput.dart';
import 'package:self_stack/utils/constans.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.black,
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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.white.withOpacity(0.3),
                filled: true,
                keyboardType: TextInputType.number,
                textStyle: TextStyle(color:whiteModel,fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
         Container(
              width: 280,
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
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Back to sign up",
                style:
                    TextStyle(color: whiteModel, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
