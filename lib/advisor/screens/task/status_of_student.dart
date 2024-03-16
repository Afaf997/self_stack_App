import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/review_updating.dart';

class StatusOfStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: const Color.fromARGB(255, 82, 203, 86),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Color.fromARGB(255, 82, 203, 86),
          title: const Text(
            'Status of Students',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          // Your StatusOfStudent screen content goes here
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewUpdatingPage(),
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 60, 59, 59),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
