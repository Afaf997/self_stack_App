import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/widgets/reusable_containers.dart';
import 'package:self_stack/utils/constans.dart';

class ReusableContainerWithTitle extends StatelessWidget {
  final List<UserDetailsTile> userDetailsTiles;

  ReusableContainerWithTitle({ required this.userDetailsTiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
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
