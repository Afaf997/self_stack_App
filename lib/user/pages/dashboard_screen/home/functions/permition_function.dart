import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:self_stack/user/response/push_notification.dart';
import 'package:self_stack/utils/constans.dart';

class NotificationService {
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static Future<void> registerNotification() async {
    Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message}");
}
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print(
          'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data},',
        );

        PushNotification notification = PushNotification(
          title: message.notification!.title ?? "",
          body: message.notification?.body ?? "",
          dataTitle: message.data['title'] ?? '',
          dataBody: message.data['body'] ?? '',
        );

        if (notification != null) {
          showSimpleNotification(
            Text(notification.title, maxLines: 1, style: TextStyle(color: kselfstackGreen)),
            subtitle: Text(notification.body, maxLines: 2),
            background: kblackDark,
            duration: Duration(seconds: 5),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
