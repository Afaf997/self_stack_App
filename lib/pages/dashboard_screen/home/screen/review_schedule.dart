import 'package:flutter/material.dart';
import 'package:self_stack/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/utils/constans.dart';

class EvaluationWidget extends StatelessWidget {
 EvaluationWidget({Key? key}) : super(key: key);

  DashBoardBloc dashBoardbloc = DashBoardBloc();

  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        dashBoardbloc.add(Dashboardnavigationevent());
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
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Icon(
              Icons.arrow_circle_right,
              color: kwhiteModel,
            ),
          ],
        ),
      ),
    );
  }
}
