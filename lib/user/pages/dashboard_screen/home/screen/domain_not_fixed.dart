import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/widgets/alert.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import for using SharedPreferences

class DomainDesidePage extends StatelessWidget {
  const DomainDesidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return InternetConnectivitySystem(
      child: Scaffold(
        backgroundColor: kbackgroundmodel,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/image/selfstack.png',
                    height: screenHeight * 0.18,
                    width: screenWidth * 0.5,
                  ),
                  IconButton(
                    onPressed: () async {
                      bool? confirmed = await showLogoutConfirmationDialog(context);
                      if (confirmed != null && confirmed) {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      color: kredtheme,
                      size: screenWidth * 0.06,
                    ),
                  ),
                ],
              ),
            Container(
  decoration: BoxDecoration(
    border: Border.all(
      color:kyellow, 
    ),
    borderRadius: BorderRadius.circular(8.0), 
  ),
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Icon(Icons.warning, color: kyellow),
      ),
      Flexible( 
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Text(
            "Your Domain Is Not Decided. Please Wait Until It Is Decided",
            style: TextStyle(color: kyellow),
            maxLines: 2,
          ),
        ),
      ),
    ],
  ),
),
SizedBox(height: 30,),

      
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "SelfStack's Green Program is a unique and exclusive learning method, which is designed to promote sustainable productivity and daily self-improvement among learners, helping them to make consistent progress toward their goals and achieve their full potential. The program includes 1-on-1 Mentorship, a Most-updated curriculum, Personalized career coaching, and 100% Placement assistance.",
                  style: TextStyle(fontSize: screenWidth * 0.04, color: kwhiteModel),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "Courses Provided:",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: kselfstackGreen,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseItem(
                    courseName: "Flutter",
                  ),
                  CourseItem(
                    courseName: "MERN Stack",
                  ),
                  CourseItem(
                    courseName: "MEAN Stack",
                  ),
                  CourseItem(
                    courseName: "Python",
                  ),
                  CourseItem(
                    courseName: "Cyber Security",
                  ),
                  CourseItem(
                    courseName: "Gaming",
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: kselfstackGreen,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3rd floor, HiLITE Business Park Thondayad, Bypass, Poovangal, Kozhikode, Kerala 673014",
                      style: TextStyle(fontSize: screenWidth * 0.04, color: kwhiteModel),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Center(
                      child: Text(
                        "connect@selfstack.com",
                        style: TextStyle(fontSize: screenWidth * 0.04, color: kblueTheme),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Center(
                      child: Text(
                        "+91 773-606-7147",
                        style: TextStyle(fontSize: screenWidth * 0.04, color: kblueTheme),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final String courseName;

  const CourseItem({
    Key? key,
    required this.courseName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenWidth * 0.01),
      child: Row(
        children: [
          Icon(Icons.check, color: kselfstackGreen),
          SizedBox(width: screenWidth * 0.02),
          Text(
            courseName,
            style: TextStyle(fontSize: screenWidth * 0.04, color: kwhiteModel),
          ),
        ],
      ),
    );
  }
}
