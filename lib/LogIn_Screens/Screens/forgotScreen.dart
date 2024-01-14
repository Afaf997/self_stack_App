import 'package:flutter/material.dart';
import 'package:self_stack/LogIn_Screens/widgets/colors.dart';



class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundmodel,
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset("assets/image/star2.png",
                width: 150, height: 150, color:whiteModel, fit: BoxFit.cover),
            const Text(
              "Forgot Password",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: whiteModel),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Enter the  email address to get link reset your password",
                style: TextStyle(color: selfstackGreen, fontSize: 16),
              ),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                 const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                
                  style: const TextStyle(color:whiteModel),
                  decoration: const InputDecoration(
                    labelText: 'Enter your Email',
                    labelStyle: TextStyle(color:  greymodel),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide(color: whiteModel),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide(color:  greymodel),
                    ),
                  ),
                ),
              ),
                const SizedBox(height: 40),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color:whiteModel,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),const SizedBox(height: 20,),
           const Padding(
              padding:EdgeInsets.only(right: 230),
              child: Text("Back to sign up",style: TextStyle(color: whiteModel,fontWeight: FontWeight.w700),),
            )
          ]),
        ),
      ),
    );
  }
}
