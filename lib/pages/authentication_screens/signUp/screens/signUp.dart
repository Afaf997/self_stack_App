// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:self_stack/blocs/signup_bloc/bloc/sign_up_bloc.dart';
// import 'package:self_stack/pages/authentication_screens/logIn_screens/Screens/login.dart';
// import 'package:self_stack/utils/constans.dart';

// class SignUp extends StatelessWidget {
//   SignUp({Key? key}) : super(key: key);

//   final SignUpBloc signUpBloc = SignUpBloc();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignUpBloc, SignUpState>(
//       bloc: signUpBloc,
//       listenWhen: (previous, current) => current is SignUpActionState,
//       buildWhen: (previous, current) => current is! SignUpActionState,
//       listener: (context, state) {
//         if (state is LoginActionState) {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//         } else if (state is SignScreenActionState) {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
//         } else if (state is SuccessState) {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: backgroundmodel,
//           body: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Text(
//                           'Create  account',
//                           style: TextStyle(
//                             color: whiteModel,
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Image.asset(
//                         "assets/image/star2.png",
//                         width: 150,
//                         height: 150,
//                         color: whiteModel,
//                         fit: BoxFit.cover,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'User name',
//                         style: TextStyle(color: whiteModel),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _nameController,
//                       style: const TextStyle(color: whiteModel),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                         labelText: 'Enter your name',
//                         labelStyle: TextStyle(color: greymodel),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(7)),
//                           borderSide: BorderSide(color: whiteModel),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(7)),
//                           borderSide: BorderSide(color: greymodel),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Email',
//                         style: TextStyle(color: whiteModel),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _emailController,
//                       style: const TextStyle(color: whiteModel),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         } else if (!RegExp(
//                                 r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
//                             .hasMatch(value)) {
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                         labelText: 'Enter your email',
//                         labelStyle: TextStyle(color: greymodel),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(7)),
//                           borderSide: BorderSide(color: whiteModel),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(7)),
//                           borderSide: BorderSide(color: greymodel),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Password',
//                         style: TextStyle(color: whiteModel),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 7),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _passwordController,
//                       style: const TextStyle(color: whiteModel),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         } else if (value.length < 6) {
//                           return 'Password must be at least 6 characters long';
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                         labelText: 'Enter your password',
//                         labelStyle: TextStyle(color: greymodel),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(7)),
//                           borderSide: BorderSide(color: whiteModel),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(7)),
//                           borderSide: BorderSide(color: greymodel),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                           GestureDetector(
//                   onTap: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         signUpBloc.add(SignUpButtonEvent(
//                           name: _nameController.text,
//                           email: _emailController.text,
//                           password: _passwordController.text,
//                         ));
//                       }
//                     },
//                     child: Container(
//                       width: 350,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: whiteModel,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           "Sign Up",
//                           style: TextStyle(color:backgroundmodel, fontSize: 18,fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       signUpBloc.add(LoginScreenNavigationevent());
//                     },
//                     child: const Text.rich(
//                       TextSpan(
//                         text: "Already have an account? ",
//                         style: TextStyle(fontSize: 14, color: whiteModel),
//                         children: [
//                           TextSpan(
//                             text: "Log In",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: selfstackGreen,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/signup_bloc/bloc/sign_up_bloc.dart';
import 'package:self_stack/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/pages/authentication_screens/signUp/widget/signup_form.dart';
import 'package:self_stack/utils/constans.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final SignUpBloc signUpBloc = SignUpBloc();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: signUpBloc,
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      listener: (context, state) {
        if (state is LoginActionState || state is SuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else if (state is SignScreenActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundmodel,
          body: SingleChildScrollView(
            child: SignUpForm(
              formKey: _formKey,
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              onSignUpPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  signUpBloc.add(SignUpButtonEvent(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  ));
                }
              },
              onLoginPressed: () {
                signUpBloc.add(LoginScreenNavigationevent());
              },
            ),
          ),
        );
      },
    );
  }
}
