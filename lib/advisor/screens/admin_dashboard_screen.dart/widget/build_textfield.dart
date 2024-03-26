  import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

Widget buildTextField(String labelText,
      {TextInputType? keyboardType, String? hintText, TextEditingController? controller, String? Function(String?)? validator,
        GlobalKey<FormState>? formKey,}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(height: 5),
        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          style: TextStyle(color: Colors.white),
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText ?? 'Enter $labelText',
            hintStyle: TextStyle(color: Colors.white54),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kwhiteModel),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kwhiteModel),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kredtheme),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color:kredtheme),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 8),
        if (formKey?.currentState != null && formKey!.currentState!.validate())
        Text(
          validator != null ? validator(controller!.text) ?? '' : '',
          style: TextStyle(color: kredtheme, fontSize: 12),
        ),
        SizedBox(height: 16),
      ],
    );
  }