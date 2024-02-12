import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/function/get_weekdetails_function.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build%20info_container.dart';

import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build_card_row.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/statcard.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/status_card.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/title_container.dart'; // Assuming you meant 'constants.dart' instead of 'constans.dart'
import 'package:self_stack/services/week_details.dart';
import 'package:self_stack/utils/constans.dart';

class TaskStatusScreen extends StatelessWidget {
  final String userId;
  final String reviewId;

  TaskStatusScreen({required this.userId, required this.reviewId});
  
  final getScoreServices getTaskService = getScoreServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kselfstackGreen,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchScoreDetails(userId,reviewId),
          
          builder: (context, tasksnapshot) {
            if (tasksnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (tasksnapshot.hasError) {
              return Text('Error: ${tasksnapshot.error}');
            } else if (tasksnapshot.hasData) {
              Map<String, dynamic> taskDetails = tasksnapshot.data!;

              return Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SectionHeader(title:taskDetails['taskName'],),
                      TaskStatusCard(title: '$userId', subtitle: 'Task Completed'),
                      InfoCard(
                          labels: ['Reviewer: ${taskDetails['reviewver']}', 'Advisor:'],
                          backgroundColor: kblackDark),
                      ksizedboxA,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: StatCard(icon: Icons.star, value: '6/10'),
                          ),
                          Expanded(
                            child: StatCard(
                                icon: Icons.calendar_today, value: '6-2-2024'),
                          ),
                        ],
                      ),
                      ksizedboxA,
                      TextCard(
                        title: 'Pending Topics :',
                        backgroundColor: kblackDark,
                        height: 0.2,
                      ),
                      TextCard(
                        title: 'Remarks :',
                        backgroundColor: kblackDark,
                        height: 0.15,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // Handle other cases, if any
              return Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
