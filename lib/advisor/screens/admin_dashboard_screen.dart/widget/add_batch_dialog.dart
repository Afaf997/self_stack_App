import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class AddBatchDialog extends StatelessWidget {
  final Function(String, DateTime?) onAddPressed;

  const AddBatchDialog({Key? key, required this.onAddPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String batchNumber = '';
    DateTime? startDate;

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
            style: TextStyle(color: Colors.white),
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
                startDate = selectedDate;
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
            style: TextStyle(color: Colors.white),
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
            onAddPressed(batchNumber, startDate);
          },
          child: Container(
            width: 70.0,
            height: 40.0,
            alignment: Alignment.center,
            child: Text('Add', style: TextStyle(color: kwhiteModel)),
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
  }
}
