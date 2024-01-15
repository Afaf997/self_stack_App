import 'package:flutter/material.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/colors.dart';

class BackgroundImageScreen extends StatelessWidget {
  const BackgroundImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(right: 110),
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
              padding: const EdgeInsets.only(right: 90),
              child: Text(
                'jdlahgenr87gyahudskjvneiafur',
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
                            style: const TextStyle(color: whiteModel),
                            decoration: const InputDecoration(
                              labelText: 'Enter your Email',
                              labelStyle: TextStyle(color: greymodel),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(color: whiteModel),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                borderSide: BorderSide(color: greymodel),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),

                           Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: selfstackGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "GET OTP",
                        style: TextStyle(color:whiteModel, fontSize: 18,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                      const Padding(
                    padding: EdgeInsets.only(right: 230),
                    child: Text(
                      "Back to sign up",
                      style: TextStyle(
                          color: whiteModel, fontWeight: FontWeight.w700),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}