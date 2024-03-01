import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String notificationHeading;
  final String notificationSubtitle;

  NotificationDetailScreen({
    required this.notificationHeading,
    required this.notificationSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        backgroundColor: kselfstackGreen,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Heading: $notificationHeading',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kwhiteModel
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Subtitle: $notificationSubtitle',
              style: TextStyle(fontSize: 16,
              color: kwhiteModel),
              
            ),
          ],
        ),
      ),
    );
  }
}
