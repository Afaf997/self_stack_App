import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:self_stack/advisor/services/review/get_review.dart';
import 'package:self_stack/user/repository/shared_preference.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:self_stack/user/response/task_model.dart'; // Import TaskModel


class ReviewUpdatingPage extends StatefulWidget {
  @override
  _ReviewUpdatingPageState createState() => _ReviewUpdatingPageState();
}

class _ReviewUpdatingPageState extends State<ReviewUpdatingPage> {
  String selectedMark = '';
  String selectedReviewStatus = '';
  String selectedTask = ''; 
  TextEditingController pendingTopicsController = TextEditingController();
  List<Task> tasksList = []; 

  @override
  void initState() {
    super.initState();
    fetchTasks(); 
  }

  void fetchTasks() async {
    String? userId = await getUserId();
    try {
      TaskModel tasksData = await ReviewService().ReviewfetchData(userId ?? '');
      setState(() {
        tasksList = tasksData.userTasks.expand((userTask) => userTask.tasks).toList();
        selectedTask = tasksList.isNotEmpty ? tasksList.first.taskName : ''; // Select the first task by default
      });
    } catch (error) {
      print('Error fetching tasks: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 82, 203, 86),
        child: Column(
          children: [
            AppBar(
              toolbarHeight: 100,
              backgroundColor: kselfstackGreen,
              title: const Text(
                'Review Updating',
                style: TextStyle(
                  color: kwhiteModel,
                  fontSize: 27,
                ),
              ),
            ),
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
                            dropdownColor:kbackgroundmodel, // Change dropdown color to white
                            value: selectedTask,
                            onChanged: (String? value) {
                              setState(() {
                                selectedTask = value!;
                              });
                            },
                            items: tasksList.map((task) {
                              return DropdownMenuItem<String>(
                                value: task.taskName,
                                child: Text(
                                  task.taskName,
                                  style: const TextStyle(color: kwhiteModel),
                                ),
                              );
                            }).toList(),
  decoration: InputDecoration(
    labelStyle: const TextStyle(color:kwhiteModel),
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
                    children: [
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
                            decoration: InputDecoration(
                              labelText: 'Enter reviewer name',
                              labelStyle: const TextStyle(color: Colors.white),
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
                                    DateTime? selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );

                                    if (selectedDate != null) {
                                      // Update the TextField or perform any other actions
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Enter date',
                                    labelStyle: const TextStyle(color: Colors.white),
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
                                        DateTime? selectedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );

                                        if (selectedDate != null) {
                                          // Update the TextField or perform any other actions
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
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Select Mark'),
                                          content: Column(
                                            children: [
                                              ListTile(
                                                title: const Text(
                                                  'Option 1',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                tileColor: Colors.red,
                                                onTap: () {
                                                  setState(() {
                                                    selectedMark = 'Option 1';
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                title: const Text(
                                                  'Option 2',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                tileColor: Colors.green,
                                                onTap: () {
                                                  setState(() {
                                                    selectedMark = 'Option 2';
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Select mark',
                                    labelStyle: const TextStyle(color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                  ),
                                  controller: TextEditingController(text: selectedMark),
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
                              childAspectRatio: 3,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0, 
                            ),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: getReviewStatusColor1(index),
                                child: RadioListTile<String>(
                                  title: Text(
                                    getReviewStatusText(index),
                                    style: const TextStyle(color: Colors.white),
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
                              fontSize: 22,
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
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>DomainPage()));
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
            ]  ),
              ),
            ),
         ) ],
        ),
      ),
    );
  }

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
