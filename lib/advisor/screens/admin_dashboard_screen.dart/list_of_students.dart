import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/status_of_student.dart';

class StudentsBatchScreen extends StatefulWidget {
  const StudentsBatchScreen({Key? key}) : super(key: key);

  @override
  _StudentsBatchScreenState createState() => _StudentsBatchScreenState();
}

class _StudentsBatchScreenState extends State<StudentsBatchScreen> {
  List<StudentData> studentsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 203, 86),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 82, 203, 86),
        title: const Text(
          'Students Batch',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notification icon press
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
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/image.png'),
                ),
                title: Text(studentsList[index].name, style: const TextStyle(color: Colors.white)),
                subtitle: Text(studentsList[index].details,style: const TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatusOfStudent(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddStudentDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _showAddStudentDialog(BuildContext context) async {
    String name = '';
    String details = '';

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Student', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 56, 56, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Details',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  details = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addNewStudent(name, details);
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }

  void _addNewStudent(String name, String details) {
    setState(() {
      final newStudent = StudentData(name: name, details: details);
      studentsList.add(newStudent);
    });
  }
}

class StudentData {
  final String name;
  final String details;

  StudentData({required this.name, required this.details});
}
