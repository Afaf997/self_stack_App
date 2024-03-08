import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/edit_screen.dart';
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
                  attendanceStatus: AttendanceStatus.offline, // Set to offline initially
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
        width: double.infinity,
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
            return Slidable(
              key: ValueKey(studentsList[index].id),
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: kblueTheme,
                    icon: Icons.edit,
                    label: 'Edit',
                    onPressed: (context) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditStudentPage(userId: studentsList[index].id),
                      ),
                    ),
                  ),
                  SlidableAction(
                    backgroundColor: kredtheme,
                    icon: Icons.delete,
                    label: 'Delete',
                    onPressed: (context) {
                      // Handle delete action
                    },
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(studentsList[index].avatarImage),
                ),
                title: Text(studentsList[index].name,
                    style: const TextStyle(color: kwhiteModel)),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Text(studentsList[index].details,
                          style: const TextStyle(color: kwhiteModel)),
                    ),
                    const SizedBox(width: 8.0),
                   DropdownButtonHideUnderline(
  child: DropdownButton<AttendanceStatus>(
    dropdownColor: kblackDark,
    value: studentsList[index].attendanceStatus,
    icon: const Icon(Icons.arrow_drop_down, color: kwhiteModel),
    iconSize: 24,
    elevation: 16,
    style: const TextStyle(color: kwhiteModel),
    onChanged: (AttendanceStatus? newValue) {
      if (newValue != null) {
        setState(() {
          studentsList[index].attendanceStatus = newValue;
        });
      }
    },
    items: AttendanceStatus.values.map<DropdownMenuItem<AttendanceStatus>>((AttendanceStatus value) {
      return DropdownMenuItem<AttendanceStatus>(
        value: value,
        child: Text(getStatusText(value)),
      );
    }).toList(),
  ),
),

                  ],
                ),
                trailing: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getAttendanceColor(studentsList[index].attendanceStatus),
                  ),
                ),
                onTap: () {
                  // Handle onTap action
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Color getAttendanceColor(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return kselfstackGreen;
      case AttendanceStatus.absent:
        return kredtheme;
      case AttendanceStatus.halfDay:
        return kblueTheme;
      case AttendanceStatus.offline:
        return kblackLight;
    }
  }

  String getStatusText(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.halfDay:
        return 'Half Day';
      case AttendanceStatus.offline:
        return 'Offline';
    }
  }
}

class StudentData {
  final String id;
  final String name;
  final String details;
  final String avatarImage;
  AttendanceStatus attendanceStatus;

  StudentData({
    required this.id,
    required this.name,
    required this.details,
    required this.avatarImage,
    required this.attendanceStatus,
  });
}

enum AttendanceStatus {
  present,
  absent,
  halfDay,
  offline,
}
