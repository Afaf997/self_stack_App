import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/edit_screen.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/review_updating.dart';
import 'package:self_stack/advisor/services/batch_services.dart/get_batch.dart';
import 'package:self_stack/utils/constans.dart';

class StudentsBatchScreen extends StatefulWidget {
  final int index;

  const StudentsBatchScreen({Key? key, required this.index}) : super(key: key);

  @override
  _StudentsBatchScreenState createState() => _StudentsBatchScreenState();
}

class _StudentsBatchScreenState extends State<StudentsBatchScreen> {
  List<StudentData> studentsList = [];

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateList();
  }

  Future<void> fetchDataAndUpdateList() async {
    try {
      BatchService batchService = BatchService();
      Welcome batchData = await batchService.fetchData();
      
      if (widget.index >= 0 && widget.index < batchData.batches.length) {
        BatchElement selectedBatch = batchData.batches[widget.index];

        setState(() {
          studentsList = selectedBatch.batch.studentIds
              .map((studentId) => StudentData(
                   id: studentId.id,
                    name: studentId.name,
                    details: "${studentId.email}",
                    avatarImage: studentId.image,
                  ))
              .toList();
        });
      } else {
        print('Invalid index provided');
      }
    } catch (error) {
      print('Error fetching and updating data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kselfstackGreen,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 100,
        backgroundColor: kselfstackGreen,
        title: const Text(
          'Students Batch',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: kwhiteModel),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: kwhiteModel),
            onPressed: () {
              //  showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: ListView.builder(
          itemCount: studentsList.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: index == 0 ? 40.0 : 8.0,
                bottom: 8.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 43, 43),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(studentsList[index].avatarImage),
                ),
                title: Text(studentsList[index].name,
                    style: const TextStyle(color:kwhiteModel)),
                subtitle: Text(studentsList[index].details,
                    style: const TextStyle(color: kwhiteModel)),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: kwhiteModel),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditStudentPage(userId:studentsList[index].id), 
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewUpdatingPage(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class StudentData {
  final String id;
  final String name;
  final String details;
  final String avatarImage;

  StudentData({required this.id,  required this.name, required this.details, required this.avatarImage});
}
