import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/widgets/bottom_navigation.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/task_status.dart';
import 'package:self_stack/utils/constans.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);
  final NavigationBloc navigationBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<NavigationBloc, NavigationState>(
      bloc: navigationBloc,
      buildWhen: (previous, current) => current is! NavigationInitial,
      listener: (context, state) {},
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
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(
                      'Hello afaf,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 15),
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kblackDark,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your next review date is\n',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              color: kwhiteModel,
                            ),
                          ),
                          TextSpan(
                            text: 'Wednesday, 18 Jan 2024',
                            style: TextStyle(
                              fontSize: screenWidth * 0.040,
                              color: kselfstackGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(
                      '"Track Your Progress"',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskStatusScreen()),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 15),
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Week 1',
                          style: TextStyle(
                            fontSize: screenWidth * 0.040,
                            color: kwhiteModel,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(navigationBloc: navigationBloc),
        );
      },
    );
  }
}
