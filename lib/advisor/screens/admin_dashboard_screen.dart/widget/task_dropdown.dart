import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/batches_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/widget/review_submit.dart';
import 'package:self_stack/utils/constans.dart';

class TaskDropdown extends StatelessWidget {
  final List<Task> tasksLists;
  final String selectedTask;
  final void Function(String?) onTaskChanged; // Change parameter type here

  TaskDropdown({
    required this.tasksLists,
    required this.selectedTask,
    required this.onTaskChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onChanged: onTaskChanged,
          items: tasksLists.map((task) {
            return DropdownMenuItem<String>(
              value: task.taskName,
              child: Text(
                task.taskName,
                style: const TextStyle(color: kwhiteModel),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: kwhiteModel),
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
    );
  }
}
