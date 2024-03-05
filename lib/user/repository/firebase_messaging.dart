// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:self_stack/response/push_notification.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message codewaa: ${message}");
// }


// class FirebaseNotification extends StatefulWidget {
//   const FirebaseNotification({super.key});

//   @override
//   State<FirebaseNotification> createState() => _FirebaseNotificationState();
// }

// class _FirebaseNotificationState extends State<FirebaseNotification> {
//   @override
// void initState() {
//   totalNotifications = 0;
//   registerNotification();
//   checkForInitialMessage();

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     PushNotification notification = PushNotification(
//       title: message.notification?.title ?? "",
//       body: message.notification?.body ?? '',
//       dataTitle: message.data['title']?? '',
//       dataBody: message.data['body']?? '',
//     );

//     setState(() {
//       _notificationInfo = notification;
//       totalNotifications++;
//     });
//   });

//   super.initState();
// }




//   late FirebaseMessaging _messaging;
// late int totalNotifications;
// late PushNotification _notificationInfo;


// void registerNotification() async {
//   await Firebase.initializeApp();
//   _messaging = FirebaseMessaging.instance;

//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   NotificationSettings settings = await _messaging.requestPermission(
//     alert: true,
//     badge: true,
//     provisional: false,
//     sound: true,
//   );

//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('User granted permission');

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print(
//           'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data},',);

//       // Parse the message received
//       PushNotification notification = PushNotification(
//         title: message.notification!.title ?? "",
//         body: message.notification?.body ?? "",
//         dataTitle: message.data['title'] ??'',
//         dataBody: message.data['body'] ??'',
//       );

//       setState(() {
//         _notificationInfo = notification;
//         totalNotifications++;
//       });

//       if (_notificationInfo != null) {
//         // For displaying the notification as an overlay
//         showSimpleNotification(
//           Text(_notificationInfo.title),
//           subtitle: Text(_notificationInfo.body),
//           background: Colors.cyan.shade700,
//           duration: Duration(seconds: 2),
//         );
//       }
//     });
//   } else {
//     print('User declined or has not accepted permission');
//   }
// }

// // For handling notification when the app is in terminated state
// checkForInitialMessage() async {
//   await Firebase.initializeApp();
//   RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

//   if (initialMessage != null) {
//     PushNotification notification = PushNotification(
//       title: initialMessage.notification?.title ?? "Default Title",
//       body: initialMessage.notification?.body ?? "Default Body",
//       dataTitle: initialMessage.data['title'] ?? "Default Data Title",
//       dataBody: initialMessage.data['body'] ?? "Default Data Body",
//     );

//     setState(() {
//       _notificationInfo = notification;
//       totalNotifications++;
//     });
//   }
// }


  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }