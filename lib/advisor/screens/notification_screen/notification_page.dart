import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/advisor/services/notification/post_notification.dart';
import 'package:self_stack/utils/constans.dart';

class NotificationScreen extends StatelessWidget {
  final List<dynamic> Ids;
  final NotificationPostService notificationPostService = NotificationPostService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  NotificationScreen({Key? key, required this.Ids}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Notification Screen', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  child: Lottie.asset(
                    'assets/lottie/notification.json',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 36),
              Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextField(
                controller: titleController,
                maxLines: null,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  hintStyle: TextStyle(color: kgreymodel),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Add border radius
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Notification',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextField(
                controller: descriptionController,
                maxLines: null,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  hintStyle: TextStyle(color: kgreymodel),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Add border radius
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String title = titleController.text;
                  String description = descriptionController.text;
                  notificationPostService.PostNotificationDetails(title, description, Ids);
                  titleController.clear();
                  descriptionController.clear();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Remove border radius
                  ),
                  backgroundColor: kselfstackGreen,
                ),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
