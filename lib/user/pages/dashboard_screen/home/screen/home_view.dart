// ignore_for_file: unused_label
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/indicater.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/permition_function.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/pie.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/about_us.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/attendence_status.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/notification_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/review_schedule.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/todo.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/card.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/enum.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/profile_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/widgets/alert.dart';
import 'package:self_stack/user/pages/dashboard_screen/schedule/schedule_screen.dart';
import 'package:self_stack/user/response/dashboard_model.dart'; 
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../repository/shared_preference.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DashBoardBloc dashBoardbloc = DashBoardBloc();
  late TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
    @override
  void initState() {
    super.initState();
    NotificationService.registerNotification();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;
          log(userId.toString());


         return FutureBuilder<Map<String, dynamic>>(
  future: fetchUserDetails(userId),
  builder: (context, userSnapshot) {
    if (userSnapshot.connectionState == ConnectionState.done) {
      if (userSnapshot.hasData) {
        Map<String, dynamic> userDetails = userSnapshot.data!;
        Users dashboard = Users.fromJson(userDetails);      
         return buildHomeScreen(context, dashboard);
      } else if (userSnapshot.hasError) {
        return buildLoadingWidget(kselfstackGreen);
      } else {
        return buildLoadingWidget(kselfstackGreen);
      }
    } else {
      return buildLoadingWidget(kselfstackGreen);
    }
  },
);} else {
          return buildLoadingWidget(kselfstackGreen);
        }
      },
    );
  }

  Widget buildHomeScreen(BuildContext context, Users dashboard) {
    dashBoardbloc.add(InitialEvent());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
String onlineText = 'Offline'; 
if (dashboard.attendance != null && dashboard.attendance!.isNotEmpty) {
  var firstAttendance = dashboard.attendance![0]; 

  if (firstAttendance['status'] != null) {
    onlineText = firstAttendance['status'];
  }
}
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
        } else if (state is AttendanceNavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AttendanceView()));
        } else if (state is TodoNavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TodoScreen()));
        } else if (state is AboutNavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AboutUsPage()));
        }
      },
      builder: (context, state) {
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () async {
            return true; 
          },
          child: Scaffold(
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
                        ),
                        SizedBox(width: screenWidth * 0.03),
                     CircleAvatar(
            radius: 14,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: ClipOval(
                child: Image.network(
          dashboard.user.image.toString(),
          fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
                        PopupMenuButton<String>(
                          color: kbackgroundmodel,
                          icon: Icon(
                            Icons.more_vert,
                            color: kwhiteModel,
                          ),
                          offset: Offset(0, 50),
                          onSelected: (String value)async {
                            if (value == 'Item 1') {
                              dashBoardbloc.add(TodoNavigationEvent());
                            } else if (value == 'Item 2') {
                              dashBoardbloc.add(AboutNavigationEvent());
                            } else if (value == 'Item 3')  {
                              log('logout'); bool? confirmed =
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
                           
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'Item 1',
                                child: Text(
                                  'Notes',
                                  style: TextStyle(color: kselfstackGreen),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Item 2',
                                child: Text(
                                  'About Us',
                                  style: TextStyle(color: kselfstackGreen),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Item 3',
                                child: Text(
                                  'Logout',
                                  style: TextStyle(color: kselfstackGreen),
                                ),
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
                          onTap: () =>
                              dashBoardbloc.add(AttendanceNavigationEvent()),
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
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CardScreen(dashboard: dashboard),
                    SizedBox(height: screenHeight * 0.02),
                    EvaluationWidget(),
                    BlocBuilder<DashBoardBloc, DashBoardState>(
                      bloc: dashBoardbloc,
                      buildWhen: (previous, current) =>
                          current is InitaialState,
                      builder: (context, state) {
                        if (state is InitaialState) {
                          List<GDPData> chatdata = state.chatdata;
                          print(state.chatdata);
                          return buildChartSection( screenWidth,state);
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
Widget buildChartSection(double screenWidth, DashBoardState state) {
  late TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  if (state is InitaialState) {
    List<GDPData> chatData = state.chatdata;
    List<Color> colors = [];
    for (var data in chatData) {
      colors.add(_getColorForReviewStatus(data.continent));
    }

    if (chatData.isNotEmpty) {
      return SfCircularChart(
        palette: colors,
        title: ChartTitle(
          text: "Status Of Review",
          textStyle: TextStyle(
            color: kwhiteModel,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
          ),
        ),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.scroll,
          textStyle: TextStyle(color: kwhiteModel),
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            dataSource: chatData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.taskValue,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
        ],
      );
    } else {
   return Padding(
  padding: const EdgeInsets.only(top: 100),
  child: Column(
    children: [
      Text("Your task has not started", style: TextStyle(color: kwhiteModel),),
      SizedBox(
        height: 200, 
        width: 200, 
        child: Center(
          child: Lottie.asset('assets/lottie/pie.json'),
        ),
      ),
    ],
  ),
);

    }
  } else {
    return CircularProgressIndicator(color: kselfstackGreen,);
  }
}


Color _getColorForReviewStatus(String status) {
  switch (status.toLowerCase()) {
    case 'not attended':
      return Colors.blue;
    case 'task completed':
      return Colors.green;
    case 'not completed':
      return Colors.orange;
    case 'need improvement':
      return Colors.yellow;
    case 'review repeat':
      return Colors.red;
    case 'scheduled':
      return Color.fromARGB(255, 215, 123, 154);
    default:
      return Colors.transparent; 
  }
}


}
