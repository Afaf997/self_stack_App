import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/domain_not_fixed.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
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
      double screenWidth = MediaQuery.of(context).size.width;
  return Scaffold(
    backgroundColor: kbackgroundmodel,
    body: Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Today', style: TextStyle(color: kwhiteModel,fontWeight: FontWeight.bold, fontSize: 30.0)),
              SizedBox(width: 30.0), 
           Container(
  width: 160.0,
  height: 40.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: kselfstackGreen,
  ),
  child: Center(
    child: Text(
      'Online',
      style: TextStyle(
        color: kwhiteModel,
        fontSize: 16.0, 
        fontWeight: FontWeight.w600
      ),
    ),
  ),
),]),
  SizedBox(height: 20.0),
  GestureDetector(
            
              child: Container(
                   margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, vertical: 15),
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kblackDark,
                      borderRadius: BorderRadius.circular(8),
                    ),
                child: Center(
                  child: Text(
                    'Your Next Review Date is',
                    style: TextStyle(
                      fontSize: screenWidth * 0.040,
                      color: kwhiteModel,
                    ),
                  ),
                ),
              ),
            )
  
       
        ],
      ),
    ),
  );
}

}
