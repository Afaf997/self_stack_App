import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

Widget buildDropdownField(
  String labelText, {
  String? initialValue,
  required List<String> options,
  required void Function(String?) onChanged,
  GlobalKey<FormState>? formKey, // Add formKey parameter here
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: TextStyle(fontSize: 15, color: kwhiteModel)),
      SizedBox(height: 5),
      Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: kwhiteModel),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: kblackDark,
                  value: initialValue,
                  icon: Icon(Icons.arrow_drop_down, color: kwhiteModel),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: kwhiteModel),
                  onChanged: onChanged,
                  items: options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          option,
                          style: TextStyle(color: kwhiteModel),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 8),
      if (formKey?.currentState?.validate() ?? false)
        Text(
          '',
          style: TextStyle(color: kredtheme, fontSize: 12),
        ),
      SizedBox(height: 16),
    ],
  );
}
