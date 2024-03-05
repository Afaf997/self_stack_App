import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class DomainDesidePage extends StatelessWidget {
  const DomainDesidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Let's connect and explore the endless possibilities in the world of tech. Contact us today!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "3rd floor, HiLITE Business Park Thondayad, Bypass, Poovangal, Kozhikode, Kerala 673014",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "connect@selfstack.com",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "+91 773-606-7147",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: "First Name",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Last Name",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Phone",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Message",
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality to send the message
              },
              child: Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
