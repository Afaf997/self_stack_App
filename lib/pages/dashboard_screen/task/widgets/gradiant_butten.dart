// import 'package:flutter/material.dart';

// class GradientButton extends StatelessWidget {
//   final VoidCallback? onpressed;
//   final String text;
//   const GradientButton({
//     super.key,
//     required this.text,
//     this.onpressed, 
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onpressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color.fromARGB(255, 255, 53, 114),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         padding: const EdgeInsets.symmetric(
//           vertical: 16.0,
//         ),
//       ),
//       child: Container(
//         width: double.infinity,
//         alignment: Alignment.center,
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }