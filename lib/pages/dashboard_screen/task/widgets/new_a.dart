 import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/utils/constans.dart';

// @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, dynamic>>(
//       future: _fetchTaskDetails(courseId, taskId),
//       builder: (context, tasksnapshot) {
//         if (tasksnapshot.connectionState == ConnectionState.done) {
//           if (tasksnapshot.data != null) {
//             Map<String, dynamic> taskDetails = tasksnapshot.data!;
//             List<dynamic> subtitles = taskDetails['subtitle'];

//             return Scaffold(
//               backgroundColor: kbackgroundmodel,
//               body: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(
//                             child: Container(
//                               width: 250.0,
//                               height: 200.0,
//                               child: Lottie.asset(
//                                 'assets/lottie/task.json',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 26.0),
//                           Center(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   taskDetails['task_name'],
//                                   style: TextStyle(
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.bold,
//                                     color: kselfstackGreen,
//                                   ),
//                                 ),
//                                 Text(
//                                   taskDetails['duration'],
//                                   style: TextStyle(fontSize: 14.0, color: kwhiteModel,fontWeight: FontWeight.bold),
//                                 ),ksizedboxC,
//                                  Text(
//                                   taskDetails['title'],
//                                   style: TextStyle(fontSize: 22.0, color: kwhiteModel,fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           ksizedboxX,
//                           for (var subtitle in subtitles)
//                             buildSubtitle(
//                               subtitle['subtitle_name'],
//                               List<String>.from(subtitle['points']),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => FeedbackScreen(tasksId: taskId,taskName: taskDetails['title'],)),
//                           );
//                         },
//                         child: Image.asset(
//                           'assets/image/feedback.png',
//                           width: 70.0,
//                           height: 70.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Center(
//               child: Text('Task details not available'),
//             );
//           }
//         } else if (!tasksnapshot.hasData) {
//          return CircularProgressIndicator();
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }

Widget buildSubtitle(String title, List<String> points) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: kwhiteModel,
        ),
      ),
      SizedBox(height: 8.0),
      Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 36, 36, 36),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var point in points)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '\u2022',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kwhiteModel,
                        ),
                      ),
                      SizedBox(width: 9.0),
                      Flexible(
                        child: Text(
                          point,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
          ],
        ),
      ),
      SizedBox(height: 20),
    ],
  );
}