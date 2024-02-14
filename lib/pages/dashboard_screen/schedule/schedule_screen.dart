import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/blocs/task_details/bloc/score_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/function/week_details.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/week_status.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);
  ScoreBloc scorebloc = ScoreBloc();
  int num=0;

  Widget buildScheduleScreen(
    BuildContext context,
    Map<String, dynamic> userDetails,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    final countTime = userDetails['reviews'] == null ? 0 :userDetails['reviews'].length;


    return BlocConsumer<ScoreBloc, ScoreState>(
      bloc: scorebloc,
      listenWhen: (previous, current) => current is scoreActionState,
      buildWhen: (previous, current) => current is! scoreActionState,
      listener: (context, state) {
        if (state is NavigationscoreState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TaskStatusScreen(userId: userDetails['student']['_id'],reviewId:userDetails['reviews'][state.index]['reviewId'],index: state.index),
            ),
          );
        }
        log('${userDetails['reviews'][0]['reviewId']}');
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kbackgroundmodel,
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(
                      'Hello, ${userDetails['student']['name']}',
                      style: TextStyle(
                        color: kwhiteModel,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05, vertical: 15),
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kblackDark,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(  countTime >0 ? userDetails['reviews'][countTime - 1]['scheduleDate'] != null && userDetails['reviews'][countTime - 1]['completedDate'] == null
                          ?'Next Review Date ${userDetails['reviews'][countTime - 1]['scheduleDate']}'
                          : 'Next Review Not Scheduled': 'Your Task is not Started',
                      style: TextStyle(
                        fontSize: screenWidth * 0.040,
                        color: countTime >0 ? 
                            userDetails['reviews'][countTime - 1]['scheduleDate'] != null && userDetails['reviews'][countTime - 1]['completedDate'] == null
                            ? kselfstackGreen
                            : kyellow : Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(               
                      '"Track Your Progress"',
                      style: TextStyle(
                        color: kwhiteModel,
                        fontSize:    countTime >0 ? userDetails['reviews'] != null &&
                   userDetails['reviews'][0]['completedDate'] == null  &&
                       userDetails['reviews'][0]['scheduleDate'] != null &&
                       countTime < 2

                         ? 0 : screenWidth *0.05 :  0 ,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
Expanded(
  child:countTime >0 && userDetails['reviews'][0]['completedDate'] != null 
      ? ListView.builder(
          itemCount: userDetails['reviews'].length,
          itemBuilder: (context, index) {
            if (index < countTime &&
                userDetails['reviews'][index]['scheduleDate'] != null &&
                userDetails['reviews'][index]['completedDate'] != null
                ) {
              return GestureDetector(
                onTap: () {
                  scorebloc.add(NavigationscoreEvent(index: index));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, vertical: 10),
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: kwhiteModel),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Week ${index + 1}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.040,
                        color: kwhiteModel,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                
              );
            }
          },
        )
      : Center(
        child: Lottie.asset(
          'assets/lottie/task.json',
          width: screenWidth * 0.60,
          height: screenWidth * 0.60,
          fit: BoxFit.cover,
        ),
      ),
),
],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;

          if (userId != null) {
            return FutureBuilder<Map<String, dynamic>>(
              future: fetchweekDetails(userId),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> userDetails = userSnapshot.data!;
                  return buildScheduleScreen(context, userDetails);
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: kselfstackGreen,
                  ));
                }
              },
            );
          } else {
            return SizedBox.shrink();
          }
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: kselfstackGreen,
          ));
        }
      },
    );
  }
}
