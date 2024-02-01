// import 'package:flutter/material.dart';

// class TextFieldWidget extends StatelessWidget {
//   final String labelText;
//   final Icon icon;
//   final obscureText;
//   const TextFieldWidget({
//     super.key,
//     required this.labelText,
//     required this.icon,
//     this.obscureText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: labelText,
//         prefixIcon: icon,
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: Color.fromARGB(255, 215, 85, 163),
//           ),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 12.0,
//           horizontal: 15.0,
//         ),
//       ),
//       // obscureText: true,
//     );
//   }
// }