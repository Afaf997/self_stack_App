import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/notification_details.dart';
import 'package:self_stack/utils/constans.dart';

class Notification_Screen extends StatelessWidget {
  const Notification_Screen({Key? key}) : super(key: key);

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
                  // Navigate to NotificationDetailScreen when ListTile is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationDetailScreen(
                        notificationHeading: 'Notification Heading $index',
                        notificationSubtitle:
                            'Notification Subtitle djkhslaf we47yirusdfhjk eriutyhjdkfgnv u4aeiwrtfhjsdnv re8usidfjkn erusidfjklanskjdfuia $index',
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
