import 'package:flutter/material.dart';
import 'package:self_stack/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/pages/dashboard_screen/profile/widgets/alert.dart';
import 'package:self_stack/pages/dashboard_screen/profile/widgets/circular_progrees.dart';
import 'package:self_stack/pages/dashboard_screen/profile/widgets/reusable_containers.dart';
import 'package:self_stack/pages/dashboard_screen/profile/widgets/title_container_reusable.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
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

                return Scaffold(
                  backgroundColor: kselfstackGreen,
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                        ),
                        child: ListTile(
                          title: Text(
                            userDetails['name'],
                            style: TextStyle(
                              color: kwhiteModel,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            userDetails['email'],
                            style: TextStyle(
                              color: kwhiteModel,
                              fontSize: 16.0,
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              child: Image.network(
                                userDetails['image'],
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              bool? confirmed =
                                  await showLogoutConfirmationDialog(context);

                              if (confirmed != null && confirmed) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.clear();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              }
                            },
                            icon: Icon(
                              Icons.logout_rounded,
                              color: kredtheme,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      ksizedboxD,
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kbackgroundmodel,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35.0),
                              topRight: Radius.circular(35.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ksizedboxC,
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ReusableContainerWithTitle(
                                        title: 'Title 1',
                                        userDetailsTiles: [
                                          UserDetailsTile(
                                            icon: Icons.category,
                                            title: 'Batch',
                                            value: userDetails['batch'],
                                          ),
                                          UserDetailsTile(
                                            icon: Icons.domain,
                                            title: 'Domain',
                                            value: userDetails['domain'],
                                          ),
                                        ],
                                      ),
                                      ReusableContainerWithTitle(
                                        title: 'Title 2',
                                        userDetailsTiles: [
                                          UserDetailsTile(
                                            icon: Icons.people,
                                            title: 'Gender',
                                            value: userDetails['gender'],
                                          ),
                                          UserDetailsTile(
                                            icon: Icons.access_time,
                                            title: 'Age',
                                            value:
                                                userDetails['age'].toString(),
                                          ),
                                          UserDetailsTile(
                                            icon: Icons.calendar_today,
                                            title: 'Date Of Birth',
                                            value: userDetails['dateOfBirth'],
                                          ),
                                        ],
                                      ),
                                      ReusableContainerWithTitle(
                                        title: 'Title 2',
                                        userDetailsTiles: [
                                          UserDetailsTile(
                                            icon: Icons.cast_for_education,
                                            title: 'Education Qualification',
                                            value: userDetails[
                                                'educationQualification'],
                                          ),
                                          UserDetailsTile(
                                            icon: Icons.work,
                                            title: 'Work Experiance',
                                            value:
                                                userDetails['workExperience'],
                                          ),
                                        ],
                                      ),
                                      ReusableContainerWithTitle(
                                        title: 'Title 2',
                                        userDetailsTiles: [
                                          UserDetailsTile(
                                            icon: Icons.people_alt,
                                            title: 'Guardian Name',
                                            value: userDetails['guardian'],
                                          ),
                                          UserDetailsTile(
                                            icon: Icons.phone,
                                            title: 'Phone',
                                            value:
                                                userDetails['phone'].toString(),
                                          ),
                                          UserDetailsTile(
                                            icon: Icons.place,
                                            title: 'Place',
                                            value: userDetails['place'],
                                          ),
                                          UserDetailsTile(
                                            icon: Icons.location_city,
                                            title: 'Address',
                                            value: userDetails['address'],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return LoadingSpinner();
              }
            },
          );
        } else {
          return LoadingSpinner();
        }
      },
    );
  }
}
