import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/advisor/bloc/dashboard/bloc/batch_bloc.dart';
import 'package:self_stack/advisor/response/batch_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/list_of_students.dart';
import 'package:self_stack/advisor/services/batch_services.dart/get_batch.dart';
import 'package:self_stack/advisor/services/batch_services.dart/post_batch.dart';
import 'package:self_stack/utils/constans.dart';

class BatchScreen extends StatefulWidget {
  const BatchScreen({Key? key}) : super(key: key);

  @override
  _BatchScreenState createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  late Future<Welcome> future;

  @override
  void initState() {
    super.initState();
    future = BatchService().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BatchBloc, BatchState>(
      listener: (context, state) {
        if (state is navigationState) {
          _showAddDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kbackgroundmodel,
            title: const Text("All Batch", style: TextStyle(color: kwhiteModel)),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                color: kwhiteModel,
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: kbackgroundmodel,
          body: FutureBuilder<Welcome>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingWidget();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                final welcome = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                          ),
                          itemCount: welcome.batches.length,
                          itemBuilder: (BuildContext context, int index) {
                            final batch = welcome.batches[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StudentsBatchScreen(),
                                  ),
                                );
                              },
                              child: buildGridItem(batch),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<BatchBloc>(context).add(NavigationEvent());
            },
            child: Icon(Icons.add, color: kwhiteModel),
            backgroundColor: kblackDark,
          ),
        );
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: kselfstackGreen,
      ),
    );
  }

  Widget buildGridItem(BatchElement batch) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 172, 172, 172),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
               'BATCH ${batch.batch.name}',
              style: const TextStyle(
                color:kblackDark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            width: double.infinity,
            color: kblackLight,
            child: Center(
              child: Text(
               '${batch.batch.studentIds?.length ?? 0} Students',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context) async {
    String batchNumber = '';
    DateTime? startDate;
return showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('Add Batches', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromARGB(255, 56, 56, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Batch Number',
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white), // Set text color to white
            onChanged: (value) {
              batchNumber = value;
            },
          ),
          const SizedBox(height: 16),
          TextField(
            readOnly: true,
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (selectedDate != null && selectedDate != startDate) {
                setState(() {
                  startDate = selectedDate;
                });
              }
            },
            decoration: InputDecoration(
              labelText: 'Start Date',
              labelStyle: TextStyle(
                color: startDate != null ? Colors.white : Colors.white,
              ),
            ),
            controller: TextEditingController(
              text: startDate != null ? "${startDate!.toLocal()}".split(' ')[0] : "",
            ),
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            _addNewContainer(batchNumber, startDate);
          },
          child: Container(
            width: 70.0,
            height: 40.0,
            alignment: Alignment.center,
            child: Text('Add',style: TextStyle(color: kwhiteModel),),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), 
            ),
            backgroundColor: Colors.green,
          ),
        ),
      ],
    );
  },
);

  }

  void _addNewContainer(String batchNumber, DateTime? startDate) async {
    try {
      bool success = await BatchPostService().PostBatchDetails(batchNumber, startDate!);

      if (success) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BatchScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add batch. Please try again.'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.$e'),
        ),
      );
    }
  }
}
