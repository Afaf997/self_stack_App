import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/advisor/response/student_data.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/edit_screen.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/status_of_student.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/widget/attendance_color.dart';
import 'package:self_stack/advisor/screens/navigation_screen.dart/navigation_admin.dart';
import 'package:self_stack/advisor/screens/notification_screen/notification_page.dart';
import 'package:self_stack/advisor/services/attendance_service/post_attendance.dart';
import 'package:self_stack/advisor/services/batch_services.dart/delete_student.dart';
import 'package:self_stack/advisor/services/batch_services.dart/get_batch.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';
import 'package:self_stack/utils/constans.dart';

class StudentsBatchScreen extends StatefulWidget {
  final int index;
  String batchId;

   StudentsBatchScreen({Key? key, required this.index,required this.batchId}) : super(key: key);

  @override
  _StudentsBatchScreenState createState() => _StudentsBatchScreenState();
}

class _StudentsBatchScreenState extends State<StudentsBatchScreen> {
  late DeleteStudentServices _DeleteStudentServices = DeleteStudentServices();
  AttendancePostService attendancePostService = AttendancePostService();
  List<AttendanceStudentUser> studentsList = [];
dynamic attendanceData; 
  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateList();
  }

  Future<void> fetchDataAndUpdateList() async {
    try {
      BatchService batchService = BatchService();
      Welcome batchData = await batchService.fetchData();
     attendanceData = await batchService.GetAttendancfetchData(); 
      if (widget.index >= 0 && widget.index < batchData.batches.length) {
        BatchElement selectedBatch = batchData.batches[widget.index];
        setState(() {
          studentsList = selectedBatch.batch.studentIds.map((studentId) {
            return AttendanceStudentUser(
              Studentuser: StudentUser(
                id: studentId.id,
                name: studentId.name,
                email: studentId.email,
                image: studentId.image,
              ),
              attendance: [],
            );
          }).toList();
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InternetConnectivitySystem(
      child: Scaffold(
        backgroundColor: kselfstackGreen,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavbarAdmin()));
            },
            icon: Icon(Icons.arrow_back, color: kwhiteModel),
          ),
          toolbarHeight: 100,
          backgroundColor: kselfstackGreen,
          title: const Text(
            'Students Batch',
            style: TextStyle(
              color: kwhiteModel,
              fontSize: 22,
            ),
          ),
          actions: [
            IconButton(
        icon: const Icon(Icons.notifications, color: kwhiteModel),
        onPressed: () {
      List<String> allIds = studentsList.map((student) => student.Studentuser.id ?? '').toList();
      Navigator.push( context, MaterialPageRoute(   builder: (context) => NotificationScreen(Ids: allIds,
          ),
        ),
      );
        },
      ),
      
            IconButton(
              icon: const Icon(Icons.delete, color: kwhiteModel),
              onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Delete Confirmation"),
                content: Text("Are you sure you want to delete?"),
                actions: [
                  TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text('Cancel',style: TextStyle(color: kwhiteModel),),
          ),
                  TextButton(
                    child: Text("Delete"),
                    onPressed: () {
                      _DeleteStudentServices.BatchRemoveDetails(widget.batchId);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavbarAdmin()));
                    },
                  ),
                ],
              );
            },
          );
        },
      )
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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatusOfStudent(
                          id: studentsList[index].Studentuser.id ?? ''),
                    ),
                  );
                },
                child: Slidable(
        key: ValueKey(studentsList[index].Studentuser.id),
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
              builder: (context) => EditStudentPage(
                  userId: studentsList[index].Studentuser.id ?? ''),
            ),
          ),
        ),
        SlidableAction(
          backgroundColor: kredtheme,
          icon: Icons.delete,
          label: 'Delete',
          onPressed: (context) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Delete"),
                  content: Text(
                      "Are you sure you want to delete this student?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        if(widget.index == 0) {
                        _DeleteStudentServices.RemoveStudentDetails( studentsList[index].Studentuser.id ??'');
                           studentsList.removeAt(index);
                        
                        } else {
                          _DeleteStudentServices.DeleteStudentDetails(widget.batchId.toString(), studentsList[index].Studentuser.id ??'');
                        }setState(() {
                          studentsList.removeAt(index);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          studentsList[index].Studentuser.image ?? ''),
                    ),
                    title: Text(studentsList[index].Studentuser.name ?? '',
                        style: const TextStyle(color: kwhiteModel)),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(studentsList[index].Studentuser.email ?? '',
                              style: const TextStyle(color: kwhiteModel)),
                        ),
                        const SizedBox(width: 8.0),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<AttendanceStatus>(
                            dropdownColor: kblackDark,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: kwhiteModel),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: kwhiteModel),
                 onChanged: (AttendanceStatus? newValue) async {
        if (newValue != null) {
      try {
        bool attendance = await attendancePostService.PostAttendanceDetails(
          studentsList[index].Studentuser.id ?? '',
          newValue.toString()
        );
       if (attendance) {
          setState(() {
            studentsList[index].attendanceStatus = newValue;
            if (attendanceData != null &&
                attendanceData['batches'] != null &&
                widget.index >= 0 &&
                widget.index < attendanceData['batches'].length &&
                attendanceData['batches'][widget.index]['students'] != null &&
                index >= 0 &&
                index < attendanceData['batches'][widget.index]['students'].length &&
                attendanceData['batches'][widget.index]['students'][index]['attendance'] != null) {
              attendanceData['batches'][widget.index]['students'][index]['attendance']['status'] = newValue.toString().split('.')[1];
            }
          });
        }
      } catch (e) {
        print('Error: $e');
      }
        }
      },                            items: AttendanceStatus.values
                                .map<DropdownMenuItem<AttendanceStatus>>(
                                    (AttendanceStatus value) {
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
                        color: getAttendanceColor((attendanceData?['batches']?[widget.index]?['students']?[index]?['attendance']?['status'] ?? 'offline'))
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
