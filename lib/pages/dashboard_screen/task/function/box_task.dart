import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/task/task_details.dart';
import 'package:self_stack/utils/constans.dart';



 Widget buildSubtitle(String subtitle, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: whiteModel),
        ),
        SizedBox(height: 8.0),
        ...points.map((point) => Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 36, 36, 36), // You can set your desired color here
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('•', style: TextStyle(fontSize: 16.0, color: whiteModel)),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        point,
                        style: TextStyle(fontSize: 16.0, color: whiteModel),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
            ],
          ),
        )),
        SizedBox(height: 16.0),
      ],
    );
  }