
// ignore_for_file: must_be_immutable, unnecessary_type_check, unused_label
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/calender_event.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/indicater.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/pie.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/about_us.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/attendence_status.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/domain_not_fixed.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/notification_screen.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/review_schedule.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/todo.dart';
import 'package:self_stack/pages/dashboard_screen/home/widget/card.dart';
import 'package:self_stack/pages/dashboard_screen/home/widget/enum.dart';
import 'package:self_stack/pages/dashboard_screen/profile/widgets/alert.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  DashBoardBloc dashBoardbloc = DashBoardBloc();
  List<GDPData> chatdata = [];
  late TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  Color formatButtonColor = Colors.white;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  final EventBloc eventbloc =EventBloc();
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0,];
  

  @override
  Widget build(BuildContext context) {
 final events = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
    )..addAll({
        for (final event in eventbloc.eventSource)
          event.date: [event]
      });
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
                return buildLoadingWidget(kselfstackGreen);
              }
            },
          );
        } else {
           return buildLoadingWidget(kselfstackGreen);
        }
      },
    );
  }

  Widget buildHomeScreen(
      BuildContext context, Map<String, dynamic> userDetails) {
    dashBoardbloc.add(InitialEvent());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String onlineText = 
    userDetails['attendance'] != null && userDetails['attendance'].length > 0
    ? userDetails['attendance'][0]['status']
    : 'Offline'; 

Color onlineColor;
switch (AttendanceEnum.fromString(onlineText)) {
  case AttendanceEnum.Present:
    onlineColor = kselfstackGreen;
    break;
  case AttendanceEnum.Holiday:
    onlineColor = kyellow; 
    break;
  case AttendanceEnum.HalfDay:
    onlineColor = kblueTheme; 
    break;
  case AttendanceEnum.Absend:
    onlineColor = kredtheme; 
    break;
  default:
    onlineColor = kblackDark;
    break;
}

    return BlocConsumer<DashBoardBloc, DashBoardState>(
      bloc: dashBoardbloc,
      listenWhen: (previous, current) => current is dashboardAction,
      buildWhen: (previous, current) => current is! dashboardAction,
      listener: (context, state) {
        if (state is DashboardnavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ScheduleScreen()));
        } else if (state is AttendanceRecordState) {
          _calendarFormat = state.format;
        } else if (state is NotificationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Notification_Screen()));
        }else if(state is AttendanceNavigationState){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AttendanceView()));
        }else if(state is TodoNavigationState){
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => TodoScreen()));
        }else if(state is AboutNavigationState){
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => AboutUsPage()));
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
                           Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          color: kwhiteModel,
                          size: screenWidth * 0.07,
                        ),
                        onPressed: () {
                          dashBoardbloc.add(NotificationEvent());
                        },
                      ),  SizedBox(width: screenWidth * 0.03),
                    CircleAvatar(
                            radius: 14,
                            child: ClipOval(
                              child: Image.network(
                                userDetails['user']['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                PopupMenuButton<String>(
                  color: kbackgroundmodel,
                  icon: Icon(
                        Icons.more_vert,
                        color: kwhiteModel,
                      ),     offset: Offset(0, 50), 
                      onSelected: (String value) {
    if (value == 'Item 1') {
      dashBoardbloc.add(TodoNavigationEvent());
    } else if (value == 'Item 2') {
      dashBoardbloc.add(AboutNavigationEvent());
    } else if (value == 'Item 3') {
             onPressed: () async {
                              bool? confirmed =
                                  await showLogoutConfirmationDialog(context);
                              if (confirmed != null && confirmed) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.clear();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              }
                            };}},
                  itemBuilder: (BuildContext context) {
                    return [                      
                      PopupMenuItem<String>(
                        value: 'Item 1',
                        child: Text('ToDo',style: TextStyle(color: kselfstackGreen),),
                      ),
                      PopupMenuItem<String>(
                        value: 'Item 2',
                        child: Text('About Us',style: TextStyle(color: kselfstackGreen),),
                      ),     
                      PopupMenuItem<String>(
                        value: 'Item 3',
                        child: Text('Logout',style: TextStyle(color: kselfstackGreen),),
                      ),
                    ];
                  },
                ),

                    ],
                  ),
                    Row(
                      children: [
                        Text('Today',
                            style: TextStyle(
                                color: kwhiteModel,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.06)),
                   
                      SizedBox(width: screenWidth * 0.04),
                      
                      GestureDetector(
                        onTap: () => dashBoardbloc.add(AttendanceNavigationEvent()),
                        child: Container(
                          width: screenWidth * 0.28,
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
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
              ],),
         
                  SizedBox(height: screenHeight * 0.06),
                 CardScreen(),
                   SizedBox(height: screenHeight * 0.02),
                  EvaluationWidget(),
                  BlocBuilder<DashBoardBloc, DashBoardState>(
                    bloc: dashBoardbloc,
                    buildWhen: (previous, current) =>
                        current is InitaialState,
                    builder: (context, state) {
                      if (state is InitaialState) {
                        chatdata = state.chatdata;
                        print(state.chatdata);
                        return SfCircularChart(
                            palette: [
                              korange,
                              kblueTheme,
                              kselfstackGreen,
                              kyellow,
                              kredtheme,],
                            title: ChartTitle(
                                text: "Status Of Review",
                                textStyle: TextStyle(
                                    color: kwhiteModel,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.04)),
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
 
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


