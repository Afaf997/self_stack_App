import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/LogIn_Screens/Screens/forgotScreen.dart';
import 'package:self_stack/LogIn_Screens/Screens/signUp.dart';
import 'package:self_stack/LogIn_Screens/bloc/auth_bloc.dart';
import 'package:self_stack/LogIn_Screens/widgets/colors.dart';
import 'package:self_stack/LogIn_Screens/widgets/reusable.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundmodel,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 40, right: 100),
//                 child: Text.rich(
//                   TextSpan(
//                     text: "Hi, Welcome! ",
//                     style: const TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: whiteModel),
//                     children: [
//                       WidgetSpan(
//                           child: Image.asset(
//                         "assets/image/hand.png",
//                         width: 35,
//                         height: 35,
//                       )),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Email',
//                     style: TextStyle(color: whiteModel),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: TextFormField(
//                   controller: _emailController,
//                   style: const TextStyle(color: whiteModel),
//                   decoration: const InputDecoration(
//                     labelText: 'Enter your email',
//                     labelStyle: TextStyle(color:  greymodel),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(7)),
//                       borderSide: BorderSide(color: whiteModel),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(7)),
//                       borderSide: BorderSide(color:  greymodel),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Password',
//                     style: TextStyle(color: whiteModel),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 7),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: TextFormField(
//                   controller: _passwordController,
//                   style: const TextStyle(color: whiteModel),
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Enter your password',
//                     labelStyle: TextStyle(color:  greymodel),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(7)),
//                       borderSide: BorderSide(color: whiteModel),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(7)),
//                       borderSide: BorderSide(color:  greymodel),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ForgotScreen()),
//                   );
//                 },
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(color: whiteModel),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 50),
//               Container(
//                 width: 347,
//                 height: 61,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: whiteModel,
//                     width: 1,
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Log In",
//                     style: TextStyle(
//                       color: whiteModel,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 22),
//                       child: Divider(
//                         color: whiteModel,
//                         height: 30,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 14),
//                     child: Text(
//                       'OR',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: whiteModel,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(right: 20),
//                       child: Divider(
//                         color: whiteModel,
//                         height: 30,
//                         endIndent: 8,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 width: 347,
//                 height: 61,
//                 decoration: BoxDecoration(
//                   color: whiteModel,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding:const EdgeInsets.only(left: 55),
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         "assets/image/google_pic.png",
//                         width: 36,
//                         height: 36,
//                       ),
//                      const Text(
//                         "Continue With Google",
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SignUp()),
//                   );
//                 },
//                 child: const Text.rich(
//                   TextSpan(
//                     text: "Don't have an account? ",
//                     style: TextStyle(fontSize: 14, color:whiteModel),
//                     children: [
//                       TextSpan(
//                         text: "Sign Up",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: selfstackGreen,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthBloc authbloc = AuthBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!_isValidEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authbloc,
      listenWhen: (previous, current)=>current is AuthActionState,
      buildWhen: (previous, current)=> current is !AuthActionState,
      listener: (context, state) {
        if(state is ForgotActionState){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>const ForgotScreen()));
        }
        else if(state is SignScreenActionState){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>const SignUp()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundmodel,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40, right: 100),
                    child: Text.rich(
                      TextSpan(
                        text: "Hi, Welcome! ",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: whiteModel,
                        ),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              "assets/image/hand.png",
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
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
                  const SizedBox(
                    height: 5,
                  ),
                  ReusableTextField(
                    label: 'Email',
                    controller: _emailController,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'password',
                        style: TextStyle(color: whiteModel),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ReusableTextField(
                    label: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                        authbloc.add(ForgotEvent());
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const ForgotScreen()),
                      // );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: whiteModel),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // authbloc.add(Loginevent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundmodel,
                      side: BorderSide(color: whiteModel, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Container(
                      width: 300,
                      height: 61,
                      child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: whiteModel,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Divider(
                            color: whiteModel,
                            height: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: whiteModel,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Divider(
                            color: whiteModel,
                            height: 30,
                            endIndent: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                      authbloc.add(GoogleConnectEvent());
                    },
                    child: Container(
                      width: 347,
                      height: 61,
                      decoration: BoxDecoration(
                        color: whiteModel,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/image/google_pic.png",
                              width: 36,
                              height: 36,
                            ),
                            const Text(
                              "Continue With Google",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                    authbloc.add(SignUpNavigationEvent());
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const SignUp()),
                      // );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(fontSize: 14, color: whiteModel),
                        children: [
                          TextSpan(
                            text: "Sign Up",
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
            ),
          ),
        );
      },
    );
  }
}
