
import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/list_of_students.dart';
import 'package:self_stack/utils/constans.dart';

class BatchScreen extends StatefulWidget {
  const BatchScreen({Key? key}) : super(key: key);

  @override
  _BatchScreenState createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  List<ContainerData> batchContainers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Batch",
                    style: TextStyle(
                      color: kwhiteModel,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: kwhiteModel,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: batchContainers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentsBatchScreen(),
                          ),
                        );
                      },
                      child: buildGridItem(batchContainers[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: Icon(Icons.add, color: kwhiteModel),
        backgroundColor: kblackDark,
      ),
    );
  }

  Widget buildGridItem(ContainerData containerData) {
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
              containerData.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            width: double.infinity,
            color: kblackLight,
            child: Center(
              child: Text(
                containerData.text,
                style: TextStyle(
                  color: containerData.startDate != null
                      ? Colors.white // White color for selected date
                      : kwhiteModel, // Your original color for batch number
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
        title: const Text('Add Container', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Batch Number',
                labelStyle: TextStyle(color: Colors.white),
              ),
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
                  color: startDate != null ? Colors.white : Colors.white, // Set white color for selected date
                ),
              ),
              controller: TextEditingController(
                text: startDate != null ? "${startDate!.toLocal()}".split(' ')[0] : "",
              // style: TextStyle(color: Colors.white), // Set white color for selected date text
              ),
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _addNewContainer(batchNumber, startDate);
            },
            child: Text('Add'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ],
      );
    },
  );
}


  void _addNewContainer(String batchNumber, DateTime? startDate) {
    setState(() {
      final newContainer = ContainerData(
        title: 'Batch $batchNumber',
        text: '13 students',
        startDate: startDate,
      );
      batchContainers.add(newContainer);
    });
  }
}

class ContainerData {
  final String title;
  final String text;
  final DateTime? startDate;

  ContainerData({required this.title, required this.text, this.startDate});
}
