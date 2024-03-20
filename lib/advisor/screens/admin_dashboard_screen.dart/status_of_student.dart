
import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/review_updating.dart';
import 'package:self_stack/advisor/screens/notification_screen/notification_page.dart';
import 'package:self_stack/utils/constans.dart';

class StatusOfStudent extends StatelessWidget {
  final String id;

  const StatusOfStudent({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor:kselfstackGreen,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: kselfstackGreen,
          title: const Text(
            'Status of Students',
            style: TextStyle(
              color: kwhiteModel,
              fontSize: 27,
            ),
          ),
            actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: kwhiteModel),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(Ids: [id],)));
            },
          ),]
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewUpdatingPage(id: id,),
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor:kblackDark,
          foregroundColor:kwhiteModel,
        ),
      ),
    );
  }
}
