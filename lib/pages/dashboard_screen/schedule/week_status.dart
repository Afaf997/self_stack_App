import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/function/get_weekdetails_function.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build%20info_container.dart';

import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build_card_row.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/statcard.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/status_card.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/title_container.dart'; 
import 'package:self_stack/services/week_details.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:color/color.dart';

RgbColor rgb = new RgbColor(192, 255, 238);
Color getColor(String colorName) {
  return RgbColor.name('red');
}

class TaskStatusScreen extends StatelessWidget {
  final String userId;
  final String reviewId;
  final int index;

  TaskStatusScreen(
      {required this.userId, required this.reviewId, required this.index});

  final getScoreServices getTaskService = getScoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kselfstackGreen,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: FutureBuilder<Map<String, dynamic>>(
            future: fetchScoreDetails(userId, reviewId),
            builder: (context, tasksnapshot) {
              if (tasksnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kselfstackGreen,
                  ),
                );
              } else if (tasksnapshot.hasError) {
                return Center(
                  child: Text('Error: ${tasksnapshot.error}'),
                );
              } else if (tasksnapshot.hasData) {
                Map<String, dynamic> taskDetails = tasksnapshot.data!;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TaskStatusCard(
                        title: 'Week ${index + 1}',
                        subtitle:
                            'Task ${taskDetails['reviewDetails'][0]['color']}',
                      ),
                      InfoCard(labels: [
                        'Reviewer: ${taskDetails['reviewver']}',
                        'Advisor: ${taskDetails['advisor']}'
                      ], backgroundColor: kblackDark),
                      ksizedboxA,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: StatCard(
                                icon: Icons.star,
                                value: '${taskDetails['points']} / 10'),
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
                );
              } else {
                return Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
