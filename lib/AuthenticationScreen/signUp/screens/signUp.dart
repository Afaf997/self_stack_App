import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/Screens/login.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/colors.dart';
import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/snackbar.dart';
import 'package:self_stack/AuthenticationScreen/signUp/bloc/sign_up_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final SignUpBloc signUpbloc = SignUpBloc();
  final TextEditingController _namecontroller= TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: signUpbloc,
      listenWhen: (previous, current) =>current is SignUpActionState ,
      buildWhen: (previous, current) =>current is !SignUpActionState  ,
      listener: (context, state) {
       if(state is LoginActionState ){
          Navigator.push(context,MaterialPageRoute(builder:(context)=> LoginPage()));
        }
        else if(state is  SignScreenActionState){
          // Navigator.push(context,MaterialPageRoute(builder:(context)=> SignUp()));
        }else if(state is SuccessState){
          // log("message");
          Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));
          // SnackbarUtils.showSuccessSnackbar(context, 'Login successful!',subMessages: 'You have successfully signed into your account ');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundmodel,
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child: Text(
                      'Create  account',
                      style: TextStyle(
                          color: whiteModel,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Image.asset("assets/image/star2.png",
                      width: 150,
                      height: 150,
                      color: whiteModel,
                      fit: BoxFit.cover),
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
                  controller: _namecontroller,
                  style: const TextStyle(color: whiteModel),
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
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
                height: 25,
              ),
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
                  controller: _emailController,
                  style: const TextStyle(color: whiteModel),
                  decoration: const InputDecoration(
                    labelText: 'Enter your email',
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
                height: 25,
              ),
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
                  controller: _passwordController,
                  style: const TextStyle(color: whiteModel),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter your password',
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
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  signUpbloc.add(SignUpButtonEvent(name: _namecontroller.text, email:_emailController.text,password: _passwordController.text));
                },

                child: Container(
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
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // signUpbloc.add(SignUpButtonEvent(name: _namecontroller.text, email:_emailController.text,password: _passwordController.text));
                },
                child: const Text.rich(
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
      },
    );
  }
}
