import 'package:flutter/material.dart';
import 'package:self_stack/LogIn_Screens/widgets/colors.dart';


class ReusableTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const ReusableTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: whiteModel),
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: 'Enter your $label',
          labelStyle: const TextStyle(color: greymodel),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: whiteModel),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: greymodel),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
