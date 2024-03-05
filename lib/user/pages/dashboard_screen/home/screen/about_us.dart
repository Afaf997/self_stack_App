import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/about_us_function.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/container_about_us.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/about_us_contact.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/widget/self_stack_container.dart';
import 'package:self_stack/user/response/about_us.dart';
import 'package:self_stack/utils/constans.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  late Future<AboutUs> aboutDetails;

  @override
  void initState() {
    super.initState();
    aboutDetails = fetchAboutDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {Navigator.pop(context);},
                  icon: Icon(Icons.arrow_back),
                  color: kwhiteModel,
                ),
                SizedBox(width: 60),
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/selfstack.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: aboutDetails,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  AboutUs userDetails = snapshot.data as AboutUs;
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kblackDark
                         
                        ),
                        child: Column(
                          children: [
                            Text(
                              userDetails.heading,
                              style: TextStyle(
                                color: kselfstackGreen,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Text(
                              userDetails.content,
                              style: TextStyle(
                                color: kwhiteModel,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      RedContainer(
                        heading: userDetails.subtitle,
                        content: userDetails.paraSub,
                      ),
                      SizedBox(height: 20),
                      for (var blueContainer in userDetails.pointsAndDetails)
                        BlueContainer(
                          heading: blueContainer.point,
                          content: blueContainer.details,
                        ),
                      SizedBox(height: 20),
                      ContactInformation(
                        userDetails: userDetails,
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
