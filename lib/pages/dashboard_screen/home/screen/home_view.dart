import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/domain_not_fixed.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data;

          return FutureBuilder<Map<String, dynamic>>(
            future: fetchUserDetails(userId!),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> userDetails = userSnapshot.data!;
                if (userDetails['domain'] == 'No') {
                  return DomainDesidePage();
                }

                return buildHomeScreen(context, userDetails);
              } else {
                return Scaffold(
                  body: Container(
                    color: kbackgroundmodel,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kselfstackGreen,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return Scaffold(
            body: Container(
              color: kbackgroundmodel,
              child: Center(
                child: CircularProgressIndicator(
                  color: kselfstackGreen,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildHomeScreen(BuildContext context, Map<String, dynamic> userDetails) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${userDetails['name']}', style: TextStyle(color: kwhiteModel)),
            Text('Email: ${userDetails['email']}', style: TextStyle(color: kwhiteModel)),
          ],
        ),
      ),
    );
  }
}
