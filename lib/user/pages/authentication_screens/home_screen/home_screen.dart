import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/user/pages/authentication_screens/signUp/screens/signUp.dart';
import 'package:self_stack/utils/constans.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  kbackgroundmodel,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding
                : EdgeInsets.only(right: 140, top: 50),
                child: Text("Welcome",
                  style: TextStyle(color: kwhiteModel, fontSize: 42,
                  ),
                ),
              ),
                  ksizedboxA,
              Center(
                child: Image.asset(
                  "assets/image/homepage.png",
                 height: 300, 
                  width: double.infinity,
                ),
              ),   
              ksizedboxX,
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text("Journey of Self",style: TextStyle(color:kwhiteModel,fontSize: 24,),),
                    Text("Discovery, Growth.",style: TextStyle(color: kwhiteModel,fontSize: 24,),)
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  GestureDetector(
                     onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: kwhiteModel, width: 1,
                        ),
                      ),    child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(color: kwhiteModel, fontSize: 18, ),
                        ),
                      ),
                    ),
                  ),
                 ksizedboxC,
                  GestureDetector(
                    onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
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
                          "Sign Up",
                          style: TextStyle(color:kwhiteModel, fontSize: 18,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
