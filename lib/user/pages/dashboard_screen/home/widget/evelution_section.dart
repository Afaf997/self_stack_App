  import 'package:flutter/material.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/utils/constans.dart';

Widget buildUpcomingEvaluationSection(double screenWidth, double screenHeight ,DashBoardBloc dashBoardBloc) {
    return GestureDetector(
      onTap: () {
        dashBoardBloc.add(Dashboardnavigationevent());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: kblackDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              'Your upcoming evaluation is.',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: kyellow,
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            Icon(
              Icons.arrow_circle_right,
              color: kwhiteModel,
            )
          ],
        ),
      ),
    );
  }