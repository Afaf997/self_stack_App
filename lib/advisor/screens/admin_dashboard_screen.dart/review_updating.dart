import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/task_fetch.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/status_of_student.dart';
import 'package:self_stack/advisor/services/review/post_review.dart';
import 'package:self_stack/advisor/services/student_review/put_student.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:self_stack/user/response/task_model.dart';
class ReviewUpdatingPage extends StatefulWidget {
  final String id;
  final dynamic reviewDetails;

  const ReviewUpdatingPage({Key? key, required this.id, required this.reviewDetails}) : super(key: key);

  @override
  _ReviewUpdatingPageState createState() => _ReviewUpdatingPageState();
}

class _ReviewUpdatingPageState extends State<ReviewUpdatingPage> {
  int selectedMark = 0;
  String selectedReviewStatus = '';
  String? selectedTask; 
  TextEditingController pendingTopicsController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController markController = TextEditingController(); 
  TextEditingController reviewerController = TextEditingController();
  ReviewPostService reviewPostService=ReviewPostService();
  StudentReviewPutService studentReviewPutService=StudentReviewPutService();
  DateTime? selectedDate; 
  List<Task> tasksList = []; 

  @override
  void initState() {
    super.initState();
    _fetchTasks();
    _initializeFields();
  }

  Future<void> _fetchTasks() async {
    List<Task> fetchedTasks = await TaskServiceFunction().fetchTasks(widget.id.toString());
    setState(() {
      tasksList = fetchedTasks;
      selectedTask = tasksList.isNotEmpty ? tasksList.first.taskName : 'hello';
    });
    _initializeFields();
  }

void _initializeFields() {
  if (widget.reviewDetails != null&& widget.reviewDetails is Map<String, dynamic>) {
    selectedTask = widget.reviewDetails['taskId'] ?? 'hle';
    reviewerController.text = widget.reviewDetails['reviewver'] ?? '';
    selectedDate = widget.reviewDetails['scheduleDate'] != null ? DateTime.parse(widget.reviewDetails['scheduleDate']) : null;
    selectedReviewStatus = widget.reviewDetails['reviewDetails'] != null && widget.reviewDetails['reviewDetails'].isNotEmpty ? widget.reviewDetails['reviewDetails'][0]['status'] : '';
    pendingTopicsController.text = widget.reviewDetails['pendingTopics'] ?? '';
    remarksController.text = widget.reviewDetails['remarks'] ?? '';
    markController.text = widget.reviewDetails['points'] != null ? widget.reviewDetails['points'].toString() : '';
    int selectedIndex = tasksList.indexWhere((task) => task.taskName == selectedTask);
    if (selectedIndex != -1) {
      setState(() {
        selectedTask = tasksList[selectedIndex].taskName;
      });
    } else {
      log('Selected task not found');
    }
  }
}

@override
  Widget build(BuildContext context) {
    return InternetConnectivitySystem(
      child: Scaffold(
        appBar: AppBar(
                  leading: IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>StatusOfStudent(id:widget.id,)));
          }, icon:Icon(Icons.arrow_back,color: kwhiteModel,)),
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 80,
          backgroundColor: kselfstackGreen,
        ),
        body: Container(
          color: kselfstackGreen,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: kbackgroundmodel,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const Text(
        'Task',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      DropdownButtonFormField<String>(
        dropdownColor: kbackgroundmodel,
        value: selectedTask,
        onChanged: (String? value) {
          setState(() {
            selectedTask = value;
          });
        },
        hint: const Text('Select your task'),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        items: tasksList.map((task) {
          return DropdownMenuItem<String>(
            value: task.taskName,
            child: Text(
              task.taskName,
              style: const TextStyle(color: kwhiteModel),
            ),
          );
        }).toList(),
               
      ),
        ],
      ),
      
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Reviewer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            
                            TextField(
                              controller: reviewerController,
                              style: TextStyle(color: kwhiteModel,fontSize: 16),
                              decoration: InputDecoration(
                                labelText: 'Enter reviewer name',
                                labelStyle: const TextStyle(color: kgreymodel),
                                
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Next Review Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onTap: () async {
                                      selectedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
      
                                      if (selectedDate != null) {
                                        setState(() {});
                                      }
                                    },
                                    readOnly: true, 
                                    controller: TextEditingController(text: selectedDate != null ? selectedDate.toString() : ''),
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Select date',
                                      labelStyle: const TextStyle(color:kgreymodel),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () async {
                                          selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2018),
                                            lastDate: DateTime(2101),
                                          );
      
                                          if (selectedDate != null) {
                                            setState(() {}); 
                                          }
                                        },
                                        child: const Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mark',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: markController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter mark',
                                      labelStyle: const TextStyle(color:kgreymodel),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color:kwhiteModel),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: kwhiteModel),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      suffixIcon: const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Review Status',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
      GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio:3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 7 
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: getReviewStatusColor1(index),
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: RadioListTile<String>(
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                getReviewStatusText(index),
                style: TextStyle(color: Colors.white, fontSize: 12), // Adjust font size here
              ),
            ),
            value: getReviewStatusText(index),
            groupValue: selectedReviewStatus,
            onChanged: (String? value) {
              setState(() {
                selectedReviewStatus = value!;
              });
            },
            tileColor: Colors.transparent,
            dense: true, 
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ),
      );
        },
      ),
      
      
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pending Topics',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 10),
        
                            TextField(
                              controller: pendingTopicsController,
                              maxLines: null, 
                              style: const TextStyle(color: kwhiteModel),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter pending topics',
                                hintStyle: TextStyle(color:kgreymodel),
                              ),
                            ),
                           const SizedBox(height: 16),
                            const Text(
                              'Remarks',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 10),
        
                            TextField(
                              controller: remarksController,
                              maxLines: null, 
                              style: const TextStyle(color: kwhiteModel),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Remarks.',
                                hintStyle: TextStyle(color:kgreymodel),
                              ),
                            ),
                           const SizedBox(height: 16),
                      Container(
        width: double.infinity, 
        child: Column(
      children: [
      Container(
        width: double.infinity, 
        alignment: Alignment.center,
        child: GestureDetector(
      onTap: () {
        String reviewer = reviewerController.text;
        String remarks = remarksController.text;
        int mark = int.tryParse(markController.text) ?? 0;
        String pendingTopics = pendingTopicsController.text;
        DateTime date = selectedDate ?? DateTime.now();
        String selectedTaskId = '';
      
        int selectedIndex = tasksList.indexWhere((task) => task.taskName == selectedTask);
        if (selectedIndex != -1) {
      selectedTaskId = tasksList[selectedIndex].taskName;
        } else {
      log('Selected task not found');
        }
      
        if (widget.reviewDetails is Map<String, dynamic> && widget.reviewDetails.containsKey('reviewId')) {
      studentReviewPutService.PutStudentReviewDetails(
        widget.reviewDetails['reviewId'],
        selectedTaskId,
        date,
        reviewer,
        selectedReviewStatus,
        pendingTopics,
        mark,
        remarks,
        widget.id,
      );
        } else {
      reviewPostService.PostReviewDetails(
        selectedTaskId,
        date,
        reviewer,
        selectedReviewStatus,
        pendingTopics,
        mark,
        remarks,
        widget.id,
      );
        }
        // Navigator.push(context, MaterialPageRoute(builder: (context) => StatusOfStudent(id: widget.id)));
        Navigator.pop(context);
      },
      
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: kblackDark,
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0), 
        child: const Text(
          'Submit',
          style: TextStyle(color:kwhiteModel,fontWeight: FontWeight.bold,fontSize: 16),
        ),
      ),
        ),
      ),
      
      
      ],
        ),
      ),
      
                          ],
                        ),
                      ],
                    ),
          )   ),
                ),
            ])  )
        
        ),
    );}

  String getReviewStatusText(int index) {
    switch (index) {
      case 0:
        return 'Task Completed';
      case 1:
              return 'Need Improvement';
      case 2:
           return 'Not Completed';
      case 3:
        return 'Not Attended';
      case 4:
        return 'Review Repeat';
      case 5:
        return 'Next Review';
      default:
        return '';
    }
  }

  Color getReviewStatusColor1(int index) {
    switch (index) {
      case 0:
        return kselfstackGreen;
      case 1:
        return kyellow;
      case 2:
        return korange;
      case 3:
        return kblueTheme;
      case 4:
        return kredtheme;
      case 5:
        return const Color.fromARGB(255, 237, 133, 168);
      default:
        return kgreymodel;
    }
  }


}


