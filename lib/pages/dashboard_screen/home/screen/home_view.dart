import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:self_stack/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/pie.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/domain_not_fixed.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DashBoardBloc dashBoardbloc = DashBoardBloc();
  List<GDPData> chatdata = [];
  late TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  Color formatButtonColor = Colors.white;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;

          return FutureBuilder<Map<String, dynamic>>(
            future: fetchUserDetails(userId!),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> userDetails = userSnapshot.data!;
                if (userDetails['domain'] == 'No') {
                  return DomainDesidePage();
                }

                return buildHomeScreen(context, userDetails);
              } else {
                return Scaffold(
                  body: Container(
                    color: kbackgroundmodel,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kselfstackGreen,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return Scaffold(
            body: Container(
              color: kbackgroundmodel,
              child: Center(
                child: CircularProgressIndicator(
                  color: kselfstackGreen,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildHomeScreen(
      BuildContext context, Map<String, dynamic> userDetails) {
    dashBoardbloc.add(InitialEvent());
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<DashBoardBloc, DashBoardState>(
      bloc: dashBoardbloc,
      listenWhen: (previous, current) => current is dashboardAction,
      buildWhen: (previous, current) => current is! dashboardAction,
      listener: (context, state) {
        if (state is DashboardnavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ScheduleScreen()));
        }else if(state is AttendanceRecordState){
           _calendarFormat=state.format;
        }
        
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kbackgroundmodel,
          body: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('Today',
                        style: TextStyle(
                            color: kwhiteModel,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                    SizedBox(width: 30.0),
                    Container(
                      width: 160.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kselfstackGreen,
                      ),
                      child: Center(
                        child: Text(
                          'Online',
                          style: TextStyle(
                              color: kwhiteModel,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      dashBoardbloc.add(Dashboardnavigationevent());
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05, vertical: 15),
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: kblackDark,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Your Next Review Date Is',
                            style: TextStyle(
                              fontSize: screenWidth * 0.040,
                              color: kyellow,
                            ),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: kwhiteModel,
                          )
                        ],
                      ),
                    ),
                  ),
                  ksizedboxC,
                  BlocBuilder<DashBoardBloc, DashBoardState>(
                    bloc: dashBoardbloc,
                    buildWhen: (previous, current) =>
                        current is InitaialState,
                    builder: (context, state) {
                      log(state.toString());
                      if (state is InitaialState) {
                        chatdata = state.chatdata;
                        print(state.chatdata);
                        return SfCircularChart(
                            palette: [
                              kselfstackGreen,
                              kredtheme,
                              kyellow,
                              kblueTheme,
                              Colors.orange
                            ],
                            title: ChartTitle(
                                text: "Status Of Review",
                                textStyle: TextStyle(
                                    color: kwhiteModel,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            legend: Legend(
                                isVisible: true,
                                overflowMode: LegendItemOverflowMode.scroll,
                                textStyle: TextStyle(color: kwhiteModel)),
                            tooltipBehavior: _tooltipBehavior,
                            series: <CircularSeries>[
                              DoughnutSeries<GDPData, String>(
                                dataSource: chatdata,
                                xValueMapper: (GDPData data, _) =>
                                    data.continent,
                                yValueMapper: (GDPData data, _) =>
                                    data.taskValue,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                enableTooltip: true,
                              )
                            ]);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  ksizedboxX,
                  Text("Attendance Record",
                      style: TextStyle(
                          color: kwhiteModel,
                          fontWeight: FontWeight.bold,
                          fontSize: 23)),
                  ksizedboxC,


                  
                  BlocBuilder<DashBoardBloc, DashBoardState>(
                    bloc: dashBoardbloc,
                    buildWhen: (previous, current)=>
                      state is DashBoardState,
                  builder: (context, state) {
                      return SizedBox(
                        width: 320,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kblackDark),
                            color: kbackgroundmodel,
                          ),
                          child: TableCalendar(
                            calendarFormat: _calendarFormat,
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
                                color: Colors.white,
                              ),
                              rightChevronIcon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
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
                              dashBoardbloc.add(AttendanceRecordEvent(format: format));
                              
                         
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
                  ),
                  ksizedboxX,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
