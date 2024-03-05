import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/notification_screen.dart';
import 'package:self_stack/user/services/notification_delete.dart';
import 'package:self_stack/utils/constans.dart';
 // Adjusted import

Future<void> showDeleteNotification(BuildContext context, String id) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kblackDark,
        title: Text('Confirm Delete', style: TextStyle(color: kwhiteModel)),
        content: Text('Are you sure you want to delete this notification?', style: TextStyle(color: kwhiteModel)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel', style: TextStyle(color: kwhiteModel)),
          ),
          TextButton(
            onPressed: () async {
              try {
                await DeleteNotificationServices().DeleteNotification(id); 
                Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Screen()));
                // Navigator.pop(context);
              } catch (error) {
                print('Error deleting notification: $error');
                // Handle error display or logging here
              }
            },
            child: Text('Delete', style: TextStyle(color: kredtheme)),
          ),
        ],
      );
    },
  );
}
