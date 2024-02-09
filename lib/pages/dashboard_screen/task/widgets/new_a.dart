//  import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:self_stack/utils/constans.dart';

// Widget buildSubtitle(String title, List<String> points) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: TextStyle(
//           fontSize: 20,
//           color: kwhiteModel,
//         ),
//       ),
//       SizedBox(height: 8.0),
//       Container(
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 36, 36, 36),
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         padding: EdgeInsets.all(15),
//         margin: EdgeInsets.only(bottom: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             for (var point in points)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         '\u2022',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: kwhiteModel,
//                         ),
//                       ),
//                       SizedBox(width: 9.0),
//                       Flexible(
//                         child: Text(
//                           point,
//                           style: TextStyle(fontSize: 15, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8.0),
//                 ],
//               ),
//           ],
//         ),
//       ),
//       SizedBox(height: 20),
//     ],
//   );
// }
