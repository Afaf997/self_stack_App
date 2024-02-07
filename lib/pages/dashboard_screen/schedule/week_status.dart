import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build%20info_container.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build_card_row.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/statcard.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/status_card.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/title_container.dart';
import 'package:self_stack/utils/constans.dart';

class TaskStatusScreen extends StatelessWidget {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                SectionHeader(title: 'web designing'),
                TaskStatusCard(title: 'Week 1', subtitle: 'Task Completed'),
                InfoCard(
                    labels: ['Reviewer:', 'Advisor:'],
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
                    height: 0.2),
                TextCard(
                    title: 'Remarks :',
                    backgroundColor: kblackDark,
                    height: 0.15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
