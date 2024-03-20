
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
      backgroundColor: kselfstackGreen,
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
      width: double.infinity,
  decoration: const BoxDecoration(
    color: kbackgroundmodel,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(35),
      topRight: Radius.circular(35),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add your nested containers here
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nested Container 1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
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
        ));
  }
}
