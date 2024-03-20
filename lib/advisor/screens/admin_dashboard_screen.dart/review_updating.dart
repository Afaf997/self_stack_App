import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/task_fetch.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:self_stack/user/response/task_model.dart';


class ReviewUpdatingPage extends StatefulWidget {
    final String id;

  const ReviewUpdatingPage({super.key, required this.id});
  @override
  _ReviewUpdatingPageState createState() => _ReviewUpdatingPageState();
}

class _ReviewUpdatingPageState extends State<ReviewUpdatingPage> {
  String selectedMark = '';
  String selectedReviewStatus = '';
    String? selectedTask; 
  TextEditingController pendingTopicsController = TextEditingController();
  TextEditingController markController = TextEditingController(); 
  TextEditingController reviewerController = TextEditingController();
  
  DateTime? selectedDate; 
  List<Task> tasksList = []; 

  @override
  void initState() {
    super.initState();
     _fetchTasks();
  }
   Future<void> _fetchTasks() async {
    List<Task> fetchedTasks = await TaskServiceFunction().fetchTasks();
    setState(() {
      tasksList = fetchedTasks;
      selectedTask = tasksList.isNotEmpty ? tasksList.first.taskName : '';
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kselfstackGreen,
        child: Column(
          children: [
            // Your existing code
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
                      // Your existing code
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
      hint: const Text('Select your task'), // Hint text for the dropdown
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
                            'Date',
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
                              fontSize: 22,
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.6,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0, 
                            ),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: getReviewStatusColor1(index),
                                child: RadioListTile<String>(
                                  title: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      getReviewStatusText(index),
                                      style: const TextStyle(color: Colors.white,fontSize: 13),
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
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 10),
  
                          TextField(
                            controller: pendingTopicsController,
                            maxLines: null, 
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter pending topics...',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                         const SizedBox(height: 16),
                          Container(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                 String reviewer = reviewerController.text;
  String mark = markController.text;
  String date = selectedDate != null ? selectedDate.toString() : '';

  log('Reviewer: $reviewer');
  log('Task: $selectedTask');
  log('Date: $date');
  log('Mark: $mark');
  log('Task Status: $selectedReviewStatus');
  log('Pending Topics: ${pendingTopicsController.text}');
   log('Id: ${widget.id}');
                                
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ), 
                                backgroundColor: const Color.fromARGB(255, 64, 64, 64),
                              ),
                              child: const Text('Submit',style: TextStyle(color:Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
        )   ),
              ),
          ])  )
      
  );}

  String getReviewStatusText(int index) {
    switch (index) {
      case 0:
        return 'Task Completed';
      case 1:
        return 'Not Completed';
      case 2:
        return 'Need Improvement';
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
        return Colors.green;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.pink;
      case 5:
        return const Color.fromARGB(255, 237, 133, 168);
      default:
        return Colors.transparent;
    }
  }


}


