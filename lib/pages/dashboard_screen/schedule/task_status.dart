import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build%20info_container.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/build_card_row.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/statcard.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/status_card.dart';
import 'package:self_stack/pages/dashboard_screen/schedule/widgets/title_container.dart';
import 'package:self_stack/utils/constans.dart';

// class TaskStatusScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: kselfstackGreen,
//       body: Padding(
//         padding: EdgeInsets.only(top: screenHeight * 0.1),
//         child: Container(
//           height: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 ksizedboxD,
//                 Padding(
//                   padding: EdgeInsets.only(right: screenWidth * 0.35),
//                   child: Text(
//                     "web designing",
//                     style: TextStyle(color: kwhiteModel, fontSize: 22),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
//                   width: double.infinity,
//                   padding: EdgeInsets.all(screenWidth * 0.05),
//                   decoration: BoxDecoration(
//                     color: kselfstackGreen,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Week 1 ",
//                         style: TextStyle(
//                             color: kwhiteModel,
//                             fontSize: screenHeight * 0.04,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: screenWidth * 0.15),
//                         child: Text(
//                           "Task Completed",
//                           style: TextStyle(
//                               color: kwhiteModel,
//                               fontSize: screenHeight * 0.03,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
//                   width: double.infinity,
//                   padding: EdgeInsets.all(screenWidth * 0.05),
//                   decoration: BoxDecoration(
//                     color: kblackDark,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Reviewer :",
//                           style: TextStyle(color: kwhiteModel, fontSize: screenHeight * 0.025)),
//                       ksizedboxC,
//                       Text("Advisor :",
//                           style: TextStyle(color: kwhiteModel, fontSize: screenHeight * 0.025)),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.015),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: screenHeight * 0.17,
//                           padding: EdgeInsets.all(screenWidth * 0.05),
//                           decoration: BoxDecoration(
//                             color: kblackDark,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.star,
//                                 color: kwhiteModel,
//                                 size: screenWidth * 0.07,
//                               ),
//                               SizedBox(height: screenHeight * 0.015),
//                               Text(
//                                 '6/10',
//                                 style: TextStyle(
//                                   color: kwhiteModel,
//                                   fontSize: screenHeight * 0.04,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.016),
//                       Expanded(
//                         child: Container(
//                           height: screenHeight * 0.17,
//                           padding: EdgeInsets.all(screenWidth * 0.05),
//                           decoration: BoxDecoration(
//                             color: kblackDark,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.calendar_today,
//                                 color: kwhiteModel,
//                                 size: screenWidth * 0.065,
//                               ),
//                               SizedBox(height: screenHeight * 0.015),
//                               Text(
//                                 '6-2-2024',
//                                 style: TextStyle(
//                                   color: kwhiteModel,
//                                   fontSize: screenHeight * 0.025,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.0075),
//                   width: double.infinity,
//                   height: screenHeight * 0.2,
//                   padding: EdgeInsets.all(screenWidth * 0.05),
//                   decoration: BoxDecoration(
//                     color: kblackDark,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     "Pending Topics :",
//                     style: TextStyle(color: kwhiteModel, fontSize: screenHeight * 0.03),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.015),
//                   width: double.infinity,
//                   height: screenHeight * 0.15,
//                   padding: EdgeInsets.all(screenWidth * 0.05),
//                   decoration: BoxDecoration(
//                     color: kblackDark,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     "Remarks :",
//                     style: TextStyle(color: kwhiteModel, fontSize: screenHeight * 0.03),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


class TaskStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kselfstackGreen,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                SectionHeader(title: 'web designing'),
                TaskStatusCard(title: 'Week 1', subtitle: 'Task Completed'),
                InfoCard(labels: ['Reviewer:', 'Advisor:'], backgroundColor: kblackDark),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: StatCard(icon: Icons.star, value: '6/10',width: 5,),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: StatCard(icon: Icons.calendar_today, value: '6-2-2024',width: 5, ),
                    ),
                  ],
                ),
                TextCard(title: 'Pending Topics :', backgroundColor: kblackDark, height: 0.2),
                TextCard(title: 'Remarks :', backgroundColor: kblackDark, height: 0.15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

