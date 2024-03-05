 import 'package:flutter/material.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/utils/constans.dart';

Widget buildTodaySection(BuildContext context, String onlineText, Color onlineColor,DashBoardBloc dashBoardBloc) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
  // List<GDPData> chatdata = [];
  // late TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  // Color formatButtonColor = Colors.white;
  // CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  // final EventBloc eventbloc =EventBloc();
    return Row(
      children: [
        Text(
          'Today',
          style: TextStyle(
            color: kwhiteModel,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06,
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        GestureDetector(
          onTap: () => dashBoardBloc.add(AttendanceNavigationEvent()),
          child: Container(
            width: screenWidth * 0.35,
            height: screenHeight * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: onlineColor,
            ),
            child: Center(
              child: Text(
                onlineText,
                style: TextStyle(
                  color: kwhiteModel,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.18),
        IconButton(
          icon: Icon(
            Icons.notifications_active_outlined,
            color: kwhiteModel,
            size: screenWidth * 0.08,
          ),
          onPressed: () {
            dashBoardBloc.add(NotificationEvent());
          },
        ),
      ],
    );
  }