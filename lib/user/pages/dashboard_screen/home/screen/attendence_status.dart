import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';

import 'package:self_stack/user/pages/dashboard_screen/home/functions/calender_event.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceView extends StatelessWidget {
  final DashBoardBloc dashBoardBloc = DashBoardBloc();
  final EventBloc eventBloc = EventBloc();
  CalendarFormat calendarFormat = CalendarFormat.twoWeeks;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return InternetConnectivitySystem(
      child: Scaffold(
        backgroundColor: kbackgroundmodel,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Attendance Record",
                style: TextStyle(
                  color: kwhiteModel,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.03,
                ),
              ),
              SizedBox(height: 10),
              BlocConsumer<DashBoardBloc, DashBoardState>(
                bloc: dashBoardBloc,
                listener: (context, state) {
                  if (state is AttendanceRecordState) {
                    calendarFormat = state.format;
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<DashBoardBloc, DashBoardState>(
                    bloc: dashBoardBloc,
                    buildWhen: (previous, current) => current is DashBoardState,
                    builder: (context, state) {
                      return SizedBox(
                        width: screenWidth * 0.8,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kblackDark),
                            color: kbackgroundmodel,
                          ),
                          child: TableCalendar(
                            eventLoader: (day) {
                              if (isBlackoutDate(day)) {
                                return [];
                              } else {
                                return eventBloc.getEventsForDay(day);
                              }
                            },
                            calendarFormat: calendarFormat,
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            calendarStyle: CalendarStyle(
                              defaultTextStyle: TextStyle(
                                color: kwhiteModel,
                              ),
                            ),
                            headerStyle: HeaderStyle(
                              titleTextStyle: TextStyle(
                                color: kwhiteModel,
                                fontWeight: FontWeight.bold,
                              ),
                              leftChevronIcon: Icon(
                                Icons.chevron_left,
                                color: kwhiteModel,
                              ),
                              rightChevronIcon: Icon(
                                Icons.chevron_right,
                                color: kwhiteModel,
                              ),
                              formatButtonVisible: true,
                              formatButtonDecoration: BoxDecoration(
                                color: kblackDark,
                              ),
                              formatButtonTextStyle: TextStyle(
                                color: kwhiteModel,
                              ),
                            ),
                            onFormatChanged: (format) {
                              dashBoardBloc
                                  .add(AttendanceRecordEvent(format: format));
                            },
                            calendarBuilders: CalendarBuilders(
                              dowBuilder: (context, day) {
                                if (day == DateTime.now()) {
                                  final text = DateFormat.E().format(day);
                                  return Center(
                                    child: Text(
                                      text,
                                      style: TextStyle(color: kblueTheme),
                                    ),
                                  );
                                }
                                if (day.weekday == DateTime.sunday) {
                                  final text = DateFormat.E().format(day);
                                  return Center(
                                    child: Text(
                                      text,
                                      style: TextStyle(color: kredtheme),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Text(
                                      DateFormat.E().format(day),
                                      style: TextStyle(color: kwhiteModel),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isBlackoutDate(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }
}
