import 'package:flutter/material.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:self_stack/utils/constans.dart';

class TodoDetailScreen extends StatelessWidget {
  final TodoModel todo;

  TodoDetailScreen({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        backgroundColor: kselfstackGreen,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: kwhiteModel),
        ),
        title: Text(
          'Todo Details',
          style: TextStyle(color: kwhiteModel, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.edit, color: kwhiteModel),
          Icon(Icons.delete, color: kwhiteModel),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
           decoration: BoxDecoration(
        border: Border.all(color: kwhiteModel),
        borderRadius: BorderRadius.circular(2),
      ),
          height: double.infinity,
          width: double.infinity, 
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title: ${todo.title}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kwhiteModel),
              ),
              SizedBox(height: 8),
              Text(
                ' ${todo.subtitle}',
                style: TextStyle(fontSize: 18, color: kwhiteModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
