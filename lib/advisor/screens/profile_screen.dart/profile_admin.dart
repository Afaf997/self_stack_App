import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class AdvisorProfile extends StatelessWidget {
  const AdvisorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
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
                  radius: 70.0,
                  backgroundImage: AssetImage(
                    'assets/image/avathar.jpg',
                  ),
                ),
              ],
            ),
            SizedBox(height: 70.0),
            Text(
              'Your Name',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: kwhiteModel,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'your.email@example.com',
              style: TextStyle(
                fontSize: 18.0,
                color: kwhiteModel,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Advisor Role',
              style: TextStyle(
                fontSize: 18.0,
                color: kwhiteModel,
              ),
            ),
            SizedBox(height: 100,),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); 
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); 
                            },
                            child: Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.logout, color:kredtheme),
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
  }
}
