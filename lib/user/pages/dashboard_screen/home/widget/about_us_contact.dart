import 'package:flutter/material.dart';
import 'package:self_stack/user/response/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onTap: () async {
            const url =
              'https://github.com/Afaf997/self_stack_App/blob/main/lib/privacy%20policy.txt';
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
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
