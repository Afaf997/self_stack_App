 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/attendence_status.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/notification_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/attandance_section.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/evelution_section.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/pie_diagram.dart';
import 'package:self_stack/user/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:table_calendar/table_calendar.dart';

import 'enum.dart';

Widget buildHomeScreen(
      BuildContext context, Map<String, dynamic> userDetails,DashBoardBloc dashBoardBloc) {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
    dashBoardBloc.add(InitialEvent());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String onlineText = userDetails['attendance'] != null &&
            userDetails['attendance'].isNotEmpty
        ? userDetails['attendance'][0]['status']
        : 'Offline';

    Color onlineColor = getOnlineColor(onlineText);

    return BlocConsumer<DashBoardBloc, DashBoardState>(
      bloc: dashBoardBloc,
      listenWhen: (previous, current) => current is dashboardAction,
      buildWhen: (previous, current) => current is! dashboardAction,
      listener: (context, state) {
        if (state is DashboardnavigationState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScheduleScreen()));
        } else if (state is AttendanceRecordState) {
          _calendarFormat = state.format;
        } else if (state is NotificationState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Notification_Screen()));
        } else if (state is AttendanceNavigationState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AttendanceView()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kbackgroundmodel,
          body: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTodaySection(context,onlineText,onlineColor,dashBoardBloc),
                  SizedBox(height: screenHeight * 0.02),
                  buildUpcomingEvaluationSection(screenWidth, screenHeight,dashBoardBloc),
                  ksizedboxC,
                  buildChartSection(screenWidth, state),
                  ksizedboxX,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color getOnlineColor(String onlineText) {
    switch (AttendanceEnum.fromString(onlineText)) {
      case AttendanceEnum.Present:
        return kselfstackGreen;
      case AttendanceEnum.Holiday:
        return kyellow;
      case AttendanceEnum.HalfDay:
        return kblueTheme;
      case AttendanceEnum.Absend:
        return kredtheme;
      default:
        return kblackDark;
    }
  }
