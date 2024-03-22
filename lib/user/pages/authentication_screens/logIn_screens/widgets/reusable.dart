import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';


class ReusableTextField extends StatefulWidget {
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
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(color: kwhiteModel),
        obscureText: widget.obscureText ? _obscureText : false,
        decoration: InputDecoration(
          labelText: 'Enter your ${widget.label}',
          labelStyle: const TextStyle(color: kgreymodel),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: kwhiteModel),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: kgreymodel),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: kgreymodel,
                  ),
                )
              : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}
