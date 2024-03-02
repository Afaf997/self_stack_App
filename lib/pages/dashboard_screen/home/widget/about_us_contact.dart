import 'package:flutter/material.dart';
import 'package:self_stack/response/about_us.dart';

class ContactInformation extends StatelessWidget {
  final AboutUs userDetails;

  const ContactInformation({
    required this.userDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( 
               userDetails.phoneNumber,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              userDetails.email,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {

          },
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

