import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

Future<bool?> showLogoutConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor:Color.fromARGB(255, 21, 21, 21),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), 
          side: BorderSide(color: kbackgroundmodel), 
        ),
        title: Text("Logout", style: TextStyle(color: kredtheme, fontWeight: FontWeight.bold)),
        content: Text("Are you sure you want to logout?", style: TextStyle(color: kwhiteModel)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel", style: TextStyle(color: kwhiteModel)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Logout", style: TextStyle(color: kredtheme)),
          ),
        ],
      );
    },
  );
}
