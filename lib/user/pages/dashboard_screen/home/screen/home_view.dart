// ignore_for_file: unused_label
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/indicater.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/pie.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/about_us.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/attendence_status.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/notification_screen.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/review_schedule.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/todo.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/card.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/enum.dart';
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
               

                Users dashboard = Users.fromJson(userDetails);
                return buildHomeScreen(context, dashboard);
                
                
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

  Widget buildHomeScreen(BuildContext context, Users dashboard) {
    dashBoardbloc.add(InitialEvent());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String onlineText = dashboard.attendance.isNotEmpty
        ? dashboard.attendance[0]['status']
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
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      CircleAvatar(
                        radius: 14,
                        child: ClipOval(
                          child: Image.network(
                            dashboard.user.image,
                            fit: BoxFit.cover,
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
                            };
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'Item 1',
                              child: Text(
                                'ToDo',
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
                        return buildCircularChart(chatdata, screenWidth);
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

  Widget buildCircularChart(List<GDPData> chatdata, double screenWidth) {
    if (chatdata.isNotEmpty) {
      return SfCircularChart(
        palette: [
          kyellow,
          kblueTheme,
          korange,
          kselfstackGreen,
          kredtheme,
        ],
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
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            dataSource: chatdata,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.taskValue,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
