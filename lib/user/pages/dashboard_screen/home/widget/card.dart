import 'package:flutter/material.dart';
import 'package:self_stack/user/response/dashboard_model.dart';
import 'package:self_stack/utils/constans.dart';

class CardScreen extends StatelessWidget {
  final Users dashboard;

  const CardScreen({Key? key, required this.dashboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kbackgroundmodel,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: kwhiteModel, width: .2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/image/for2.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ksizedboxD,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Motivation Quotes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kwhiteModel,
                      ),
                    ),
                  ),
                  Text(
                    ' " ${dashboard.randomQuote} " ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          ' - ${dashboard.randomAuthor}',
                          style: TextStyle(
                            fontSize: 14,
                            color: kwhiteModel,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
