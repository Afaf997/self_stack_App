import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/pages/dashboard_screen/profile/widgets/reusable_containers.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';

class ReusableContainerWithTitle extends StatelessWidget {
  final String title;
  final List<UserDetailsTile> userDetailsTiles;

  ReusableContainerWithTitle({required this.title, required this.userDetailsTiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 300),
          child: Text(
            title,
            style: TextStyle(color: kwhiteModel, fontSize: 18),
          ),
        ),
        Center(
          child: Container(
            width: 340,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: kblackDark,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: userDetailsTiles,
            ),
          ),
        ),
        ksizedboxC
      ],
    );
  }
}
