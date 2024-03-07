import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Notification Screen', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            TextField(
              maxLines: null, // Allow multiline input
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter title...',
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(), // Add border to the TextField
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Notification',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            TextField(
              maxLines: null, // Allow multiline input
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter body...',
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(), // Add border to the TextField
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  print('Notification submitted!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set button color
                  onPrimary: Colors.white, // Set text color
                  fixedSize: Size(60, 60), // Set button size to be a square
                ),
                child: Icon(Icons.arrow_forward, size: 30), // You can replace this icon with your own
              ),
            ),
          ],
        ),
      ),
    );
  }
}
