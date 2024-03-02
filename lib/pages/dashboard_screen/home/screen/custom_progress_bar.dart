import 'package:flutter/material.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:self_stack/utils/constans.dart';

class CustomRoundProgressBar extends StatelessWidget {
  final double percentage;
  final String status;
  final TodoModel todo;

  const CustomRoundProgressBar({required this.percentage, required this.status, required this.todo});

  @override
  Widget build(BuildContext context) {
    Color testColor = kselfstackGreen;
    if (status == 'pending') {
      testColor = kyellow;
    }
   return GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${todo.title}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Do You Want Compleate This?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: kblackDark),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle submit logic here
                Navigator.pop(context); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kselfstackGreen,
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: kwhiteModel),
              ),
            ),
          ],
        );
      },
    );
  },
  child: Container(
    width: 30,
    height: 30,
    child: Stack(
      children: [
        CircularProgressIndicator(
          value: percentage,
          color: testColor,
          backgroundColor: kblackLight,
          strokeWidth: 3,
        ),
        Center(
          child: Text(
            '${(percentage * 100).toInt()}%',
            style: TextStyle(
              color: kwhiteModel,
              fontWeight: FontWeight.bold,
              fontSize: 9,
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}
