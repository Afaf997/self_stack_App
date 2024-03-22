import 'package:flutter/material.dart';
import 'package:self_stack/advisor/services/profile/get_admin.dart';
import 'package:self_stack/user/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/user/pages/dashboard_screen/profile/widgets/alert.dart';
import 'package:self_stack/user/repository/shared_preference.dart';
import 'package:self_stack/user/response/dashboard_model.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvisorProfile extends StatelessWidget {
  AdvisorProfile({Key? key}) : super(key: key);

  final getProfileServices getprofileServices = getProfileServices();

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
                Users user = Users.fromJson(userDetails);
                return Scaffold(
                  backgroundColor: kbackgroundmodel,
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: kselfstackGreen,
                  ),
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: kbackgroundmodel,
                              radius: 50.0,
                               child: ClipOval(
                              child: Image.network(
                                user.user.image!,
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ),
                          ],
                        ),
                             SizedBox(height: 8.0),
                        Text(
                          user.user.name.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: kwhiteModel,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          user.user.email.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: kwhiteModel,
                          ),
                        ),
              
                        SizedBox(
                          height: 100,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              bool? confirmed = await showLogoutConfirmationDialog(context);

                              if (confirmed != null && confirmed) {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                await prefs.clear();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              }
                            },
                            icon: Icon(Icons.logout, color: kredtheme),
                            label: Text('Logout', style: TextStyle(color: kwhiteModel)),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: kselfstackGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // Placeholder widget while loading user data
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        } else {
          // Placeholder widget while loading user ID
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
