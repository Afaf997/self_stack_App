import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/alert_notification.dart';
import 'package:self_stack/user/services/notification_delete.dart';
import 'package:self_stack/utils/constans.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String notificationHeading;
  final String notificationSubtitle;
  final String id;

  NotificationDetailScreen({
    required this.notificationHeading,
    required this.notificationSubtitle,
    required this.id,
  });

  final DeleteNotificationServices deleteService = DeleteNotificationServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        backgroundColor: kselfstackGreen,
        iconTheme: IconThemeData(color: kwhiteModel),
        actions: [
          IconButton(
            onPressed: () {
             
              showDeleteNotification(context,id);
            },
            icon: Icon(Icons.delete, color: kwhiteModel),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Heading: $notificationHeading',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  fontSize: 18,
                  color: kselfstackGreen,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Subtitle: $notificationSubtitle',
                style: TextStyle(fontSize: 16, color: kwhiteModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
