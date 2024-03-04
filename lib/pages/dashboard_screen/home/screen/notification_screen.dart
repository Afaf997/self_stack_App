import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/notification_function.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/notification_details.dart';
import 'package:self_stack/response/notification_model.dart';
import 'package:self_stack/response/push_notification.dart';
import 'package:self_stack/utils/constans.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message}");
}

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({Key? key}) : super(key: key);

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
  late FirebaseMessaging _messaging;
  late int totalNotifications;
  late List<NotificationElement> notifications;
  late Future<Notification_model> notificationFuture;

  @override
  void initState() {
    totalNotifications = 0;
    notifications = []; // Initialize notifications list
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title ?? "",
        body: message.notification?.body ?? '',
        dataTitle: message.data['title'] ?? '',
        dataBody: message.data['body'] ?? '',
      );

      if (mounted) {
        setState(() {
          totalNotifications++;
        });
      }
    });

    super.initState();
  }

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
          'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data},',
        );

        PushNotification notification = PushNotification(
          title: message.notification!.title ?? "",
          body: message.notification?.body ?? "",
          dataTitle: message.data['title'] ?? '',
          dataBody: message.data['body'] ?? '',
        );

        // Check if the widget is still mounted before calling setState
        if (mounted) {
          setState(() {
            totalNotifications++;
          });
        }

        if (notification != null) {
          showSimpleNotification(
            Text(notification.title),
            subtitle: Text(notification.body),
            background: kblueTheme,
            duration: Duration(seconds: 5),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title ?? "Default Title",
        body: initialMessage.notification?.body ?? "Default Body",
        dataTitle: initialMessage.data['title'] ?? "Default Data Title",
        dataBody: initialMessage.data['body'] ?? "Default Data Body",
      );

      // Check if the widget is still mounted before calling setState
      if (mounted) {
        setState(() {
          totalNotifications++;
        });
      }
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: kbackgroundmodel,
    appBar: AppBar(
      backgroundColor: kselfstackGreen,
      elevation: 0,
      toolbarHeight: 80,
      leading: IconButton(
        icon: Icon(Icons.arrow_circle_left_outlined, size: 27, color: kwhiteModel,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Notifications',
        style: TextStyle(
          color: kwhiteModel,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<Notification_model>(
        future: fetchNotificationDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No notification data available.'),
            );
          } else {
            Notification_model notification = snapshot.data!;

            return ListView.builder(
              itemCount: notification.notifications.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationDetailScreen(
                          notificationHeading: notification.notifications[index].title,
                          notificationSubtitle: notification.notifications[index].body,
                        ),
                      ),
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                             Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${DateTime.now().toString().split(".")[0].split(" ")[1]}',
                              style: TextStyle(
                                color: kwhiteModel,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          
                          title: Text(
                            notification.notifications[index].title,
                            style: TextStyle(
                              color: kselfstackGreen, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            notification.notifications[index].body,
                            style: TextStyle(
                              color: kwhiteModel, 
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${DateTime.now().toString().split(" ")[0]}',
                              style: TextStyle(
                                color: kyellow,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: kwhiteModel, 
                          thickness: 0.2,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    ),
  );
}
}