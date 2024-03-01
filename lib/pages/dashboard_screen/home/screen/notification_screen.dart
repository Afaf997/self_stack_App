import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/notification_details.dart';
import 'package:self_stack/response/push_notification.dart';
import 'package:self_stack/utils/constans.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message codewaa: ${message}");
}

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({Key? key}) : super(key: key);

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
   @override
void initState() {
  totalNotifications = 0;
  registerNotification();
  checkForInitialMessage();

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    PushNotification notification = PushNotification(
      title: message.notification?.title ?? "",
      body: message.notification?.body ?? '',
      dataTitle: message.data['title']?? '',
      dataBody: message.data['body']?? '',
    );

    setState(() {
      _notificationInfo = notification;
      totalNotifications++;
    });
  });

  super.initState();
}




  late FirebaseMessaging _messaging;
late int totalNotifications;
late PushNotification _notificationInfo;


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
          'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data},',);
          
      PushNotification notification = PushNotification(
        title: message.notification!.title ?? "",
        body: message.notification?.body ?? "",
        dataTitle: message.data['title'] ??'',
        dataBody: message.data['body'] ??'',
      );

      setState(() {
        _notificationInfo = notification;
        totalNotifications++;
      });

      if (_notificationInfo != null) {
        // For displaying the notification as an overlay
        showSimpleNotification(
          Text(_notificationInfo.title),
          subtitle: Text(_notificationInfo.body),
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 2),
        );
      }
    });
  } else {
    print('User declined or has not accepted permission');
  }
}

// For handling notification when the app is in terminated state
checkForInitialMessage() async {
  await Firebase.initializeApp();
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    PushNotification notification = PushNotification(
      title: initialMessage.notification?.title ?? "Default Title",
      body: initialMessage.notification?.body ?? "Default Body",
      dataTitle: initialMessage.data['title'] ?? "Default Data Title",
      dataBody: initialMessage.data['body'] ?? "Default Data Body",
    );

    setState(() {
      _notificationInfo = notification;
      totalNotifications++;
    });
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
        child: Container(
          child: ListView.builder(
            itemCount: 5, 
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationDetailScreen(
                        notificationHeading: 'Notification Heading $index',
                        notificationSubtitle:
                            'Notification Subtitle  $index',
                      ),
                    ),
                  );
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Notification Heading $index',
                          style: TextStyle(
                            color: kselfstackGreen, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Notification Subtitle djkhslaf we47yirusdfhjk eriutyhjdkfgnv u4aeiwrtfhjsdnv re8usidfjkn erusidfjklanskjdfuia $index',
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
                            ' ${DateTime.now().toString()}',
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
          ),
        ),
      ),
    );
  }
}
