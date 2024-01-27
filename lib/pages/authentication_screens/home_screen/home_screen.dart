import 'package:flutter/material.dart';
import 'package:self_stack/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/pages/authentication_screens/signUp/screens/signUp.dart';
import 'package:self_stack/utils/constans.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  backgroundmodel,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 140, top: 50),
                child: Text("Welcome",
                  style: TextStyle(color: whiteModel, fontSize: 42,
                  ),
                ),
              ),
                  sizedboxA,
              Center(
                child: Image.asset(
                  "assets/image/homepage.png",
                 height: 300, 
                  width: double.infinity,
                ),
              ),   
              sizedboxX,
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text("Journey of Self",style: TextStyle(color:whiteModel,fontSize: 24,),),
                    Text("Discovery, Growth.",style: TextStyle(color: whiteModel,fontSize: 24,),)
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  GestureDetector(
                     onTap: () {
                      Navigator.push(
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
                          color: whiteModel, width: 1,
                        ),
                      ),    child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(color: whiteModel, fontSize: 18, ),
                        ),
                      ),
                    ),
                  ),
                 sizedboxC,
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
                        color: selfstackGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color:whiteModel, fontSize: 18,),
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