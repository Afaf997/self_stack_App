import 'package:flutter/material.dart';
import 'package:self_stack/LogIn_Screens/Screens/login.dart';
import 'package:self_stack/LogIn_Screens/widgets/colors.dart';



class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundmodel,
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: const Text('Create  account',style: TextStyle(color: whiteModel,fontSize: 26,fontWeight: FontWeight.bold),),
             ),
              Image.asset("assets/image/star2.png",width: 150,height: 150,color: whiteModel,fit:BoxFit.cover),
            ],
          ),
           const SizedBox(height: 10),
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User name',
                  style: TextStyle(color: whiteModel),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                // controller: _emailController,
                style: const TextStyle(color: whiteModel),
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
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
            const SizedBox(height:25,),
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
                // controller: _emailController,
                style: const TextStyle(color:whiteModel),
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
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
          const SizedBox(height: 25,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(color: whiteModel),
                ),
              ),
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                // controller: _passwordController,
                style: const TextStyle(color: whiteModel),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Enter your password',
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
             const SizedBox(height: 50),
            Container(
              width: 347,
              height: 61,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: whiteModel,
                  width: 1,
                ),
              ),
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: whiteModel,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
                const SizedBox(height: 20,),
  GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  },
  child:const  Text.rich(
    TextSpan(
      text: "Already have an account? ",
      style: TextStyle(fontSize: 14, color: whiteModel),
      children: [
        TextSpan(
          text: "Log In",
          style: TextStyle(
            fontSize: 16,
            color: selfstackGreen,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  ),
),
            
        ],
      ),
    );
  }
}
