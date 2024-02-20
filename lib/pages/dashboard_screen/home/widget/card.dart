import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kbackgroundmodel,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
        side: BorderSide(color: kwhiteModel,width: .2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: 80,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image/images1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Motivational Quote',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kwhiteModel
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your motivational quote goes here. It can be as long as you want.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
