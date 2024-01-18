import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

// class SignUpTextField extends StatelessWidget {
//   const SignUpTextField({
//     Key? key,
//     required this.label,
//     required this.controller,
//     this.obscureText = false,
//     required this.validator,
//   }) : super(key: key);

//   final String label;
//   final TextEditingController controller;
//   final bool obscureText;
//   final String? Function(String?) validator;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 10),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               label,
//               style: TextStyle(color: whiteModel),
//             ),
//           ),
//         ),
//         const SizedBox(height: 5),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             style: const TextStyle(color: whiteModel),
//             validator: validator,
//             decoration: InputDecoration(
//               labelText: 'Enter your $label',
//               labelStyle: TextStyle(color: greymodel),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(7)),
//                 borderSide: BorderSide(color: whiteModel),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(7)),
//                 borderSide: BorderSide(color: greymodel),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
class SignUpTextField extends StatelessWidget {
  const SignUpTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(color: whiteModel),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(color: whiteModel),
            validator: validator,
            decoration: InputDecoration(
              labelText: 'Enter your $label',
              labelStyle: TextStyle(color: greymodel),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.035)),
                borderSide: BorderSide(color: whiteModel),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.035)),
                borderSide: BorderSide(color: greymodel),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
