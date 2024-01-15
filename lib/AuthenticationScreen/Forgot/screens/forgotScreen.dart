// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// // import 'package:self_stack/AuthenticationScreen/Forgot/bloc/forgot_bloc.dart';
// // import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/colors.dart';

// // class ForgotScreen extends StatefulWidget {
// //   ForgotScreen({Key? key}) : super(key: key);

// //   @override
// //   _ForgotScreenState createState() => _ForgotScreenState();
// // }

// // class _ForgotScreenState extends State<ForgotScreen> {
// //   final ForgotBloc forgotBlocModel = ForgotBloc();
// //   bool showOtpFields = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<ForgotBloc, ForgotState>(
// //       bloc: forgotBlocModel,
// //       listenWhen: (previous, current) => current is SignUpActionState,
// //       buildWhen: (previous, current) => current is! SignUpActionState,
// //       listener: (context, state) {
// //         if (state is ForgotScreenState) {}
// //       },
// //       builder: (context, state) {
// //         return Scaffold(
// //           backgroundColor: backgroundmodel,
// //           body: Padding(
// //             padding: const EdgeInsets.only(top: 70),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Image.asset(
// //                     "assets/image/lock.png",
// //                     width: 150,
// //                     height: 150,
// //                     color: whiteModel,
// //                     fit: BoxFit.cover,
// //                   ),
// //                   const Text(
// //                     "Forgot Password",
// //                     style: TextStyle(
// //                         fontSize: 30,
// //                         fontWeight: FontWeight.bold,
// //                         color: whiteModel),
// //                   ),
// //                   const SizedBox(
// //                     height: 50,
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.only(left: 30),
// //                     child: Text(
// //                       "Enter the email address to get a link to reset your password",
// //                       style: TextStyle(color: selfstackGreen, fontSize: 16),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 50),
// //                   Column(
// //                     children: [
// //                       const Padding(
// //                         padding: EdgeInsets.symmetric(horizontal: 20),
// //                         child: Align(
// //                           alignment: Alignment.centerLeft,
// //                           child: Text(
// //                             'Email',
// //                             style: TextStyle(color: whiteModel),
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 5),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20),
// //                         child: TextFormField(
// //                           style: const TextStyle(color: whiteModel),
// //                           decoration: const InputDecoration(
// //                             labelText: 'Enter your Email',
// //                             labelStyle: TextStyle(color: greymodel),
// //                             enabledBorder: OutlineInputBorder(
// //                               borderRadius:
// //                                   BorderRadius.all(Radius.circular(7)),
// //                               borderSide: BorderSide(color: whiteModel),
// //                             ),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderRadius:
// //                                   BorderRadius.all(Radius.circular(7)),
// //                               borderSide: BorderSide(color: greymodel),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       if (showOtpFields)
// //                         Padding(
// //                           padding: const EdgeInsets.only(top: 30),
// //                           child: OtpTextField(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             numberOfFields: 6,
// //                             fillColor: Colors.white,
// //                             filled: true,
// //                             keyboardType: TextInputType.number,
// //                           ),
// //                         ),
// //                       const SizedBox(height: 40),
// //                       Container(
// //                         width: 350,
// //                         height: 50,
// //                         decoration: BoxDecoration(
// //                           color: whiteModel,
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                         child: TextButton(
// //                           onPressed: () {
// //                             setState(() {
// //                               showOtpFields = true;
// //                             });
// //                           },
// //                           child: Center(
// //                             child: Text(
// //                               showOtpFields ? "VERIFY" : "GET OTP",
// //                               style: const TextStyle(
// //                                 color: Colors.black,
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(
// //                     height: 20,
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.only(right: 230),
// //                     child: Text(
// //                       "Back to sign up",
// //                       style: TextStyle(
// //                           color: whiteModel, fontWeight: FontWeight.w700),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:self_stack/AuthenticationScreen/Forgot/bloc/forgot_bloc.dart';
// import 'package:self_stack/AuthenticationScreen/LogIn_Screens/widgets/colors.dart';

// class ForgotScreen extends StatefulWidget {
//   ForgotScreen({Key? key}) : super(key: key);

//   @override
//   _ForgotScreenState createState() => _ForgotScreenState();
// }

// class _ForgotScreenState extends State<ForgotScreen> {
//   final ForgotBloc forgotBlocModel = ForgotBloc();
//   bool showOtpFields = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ForgotBloc, ForgotState>(
//       bloc: forgotBlocModel,
//       listenWhen: (previous, current) => current is SignUpActionState,
//       buildWhen: (previous, current) => current is! SignUpActionState,
//       listener: (context, state) {
//         if (state is ForgotScreenState) {}
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: backgroundmodel,
//           body: Padding(
//             padding: const EdgeInsets.only(top: 70),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     "assets/image/lock.png",
//                     width: 150,
//                     height: 150,
//                     color: whiteModel,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     showOtpFields ? "Verification" : "Forgot Password",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: whiteModel,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     showOtpFields
//                         ? "You will get an OTP"
//                         : "Enter the email address to get a link to reset your password",
//                     style: TextStyle(color: selfstackGreen, fontSize: 16),
//                   ),
//                   const SizedBox(height: 50),
//                   if (!showOtpFields)
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Email',
//                               style: TextStyle(color: whiteModel),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: TextFormField(
//                             style: const TextStyle(color: whiteModel),
//                             decoration: const InputDecoration(
//                               labelText: 'Enter your Email',
//                               labelStyle: TextStyle(color: greymodel),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(7)),
//                                 borderSide: BorderSide(color: whiteModel),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(7)),
//                                 borderSide: BorderSide(color: greymodel),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   if (showOtpFields)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30),
//                       child: OtpTextField(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         numberOfFields: 6,
//                         fillColor: Colors.white,
//                         filled: true,
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                   const SizedBox(height: 40),
//                   Container(
//                     width: 350,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: whiteModel,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           showOtpFields = true;
//                         });
//                       },
//                       child: Center(
//                         child: Text(
//                           showOtpFields ? "Enter Varification Code" : "GET OTP",
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(right: 230),
//                     child: Text(
//                       "Back to sign up",
//                       style: TextStyle(
//                           color: whiteModel, fontWeight: FontWeight.w700),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }