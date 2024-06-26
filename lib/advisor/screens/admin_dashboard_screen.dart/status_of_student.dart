import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/review_updating.dart';
import 'package:self_stack/advisor/screens/navigation_screen.dart/navigation_admin.dart';
import 'package:self_stack/advisor/screens/notification_screen/notification_page.dart';
import 'package:self_stack/advisor/services/student_review/get_student.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';
import 'package:self_stack/utils/constans.dart';

class StatusOfStudent extends StatefulWidget {
  final String id;

  StatusOfStudent({Key? key, required this.id}) : super(key: key);

  @override
  _StatusOfStudentState createState() => _StatusOfStudentState();
}

class _StatusOfStudentState extends State<StatusOfStudent> with SingleTickerProviderStateMixin {
  late Future<dynamic> _futureStudentData;
  ReviewStudentService reviewStudentService = ReviewStudentService();
  List<dynamic> _reviews = [];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _futureStudentData = reviewStudentService.reviewStudentData(widget.id);
    _futureStudentData.then((responseData) {
      List<dynamic> reviews = responseData['reviews'];
      for (var i = 0; i < reviews.length; i++) {
        Future.delayed(Duration(milliseconds: 200 * i), () {
          setState(() {
            _reviews.add(reviews[i]);
            _controller.forward();
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getColorFromValue(String value) {
    switch (value.toLowerCase()) {
      case 'red':
        return kredtheme;
      case 'yellow':
        return kyellow;
      case 'green':
        return kselfstackGreen;
      case 'blue':
        return kblueTheme;
      case 'orange':
        return korange;
      case 'pink':
        return Colors.pink;
      default:
        return kgreymodel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: InternetConnectivitySystem(
        child: Scaffold(
          backgroundColor: kselfstackGreen,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavbarAdmin()));
              },
              icon: Icon(Icons.arrow_back, color: kwhiteModel),
            ),
            toolbarHeight: 80,
            backgroundColor: kselfstackGreen,
            title: const Text(
              'Status of Students',
              style: TextStyle(
                color: kwhiteModel,
                fontSize: 22,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications, color: kwhiteModel),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(Ids: [widget.id])));
                },
              ),
            ],
          ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kbackgroundmodel,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _reviews.isEmpty
                  ? Center(
                child: Lottie.asset('assets/lottie/box.json'),
              )
                  : ListView.builder(
                shrinkWrap: false,
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  var review = _reviews[index];
                  Color color = getColorFromValue(review['reviewDetails'][0]['color'].toString());
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewUpdatingPage(id: widget.id, reviewDetails: review),
                        ),
                      );
                    },
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_controller),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: color,width: 2),
                          // Set border color
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${review['taskId']}',
                                  style: TextStyle(fontSize: 17, color: kwhiteModel),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  '${review['points'].toString()}',
                                  style: TextStyle(fontSize: 16, color: kwhiteModel),
                                ),
                              ],
                            ),
        
                            Text(
                              'Reviewer: ${review['reviewver']}',
                              style: TextStyle(fontSize: 16, color: kwhiteModel),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewUpdatingPage(id: widget.id, reviewDetails: []),
                ),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: kblackDark,
            foregroundColor: kwhiteModel,
          ),
        ),
      ),
    );
  }
}
