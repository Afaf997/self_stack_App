import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/delete_conformation.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/edit_conformation.dart';
import 'package:self_stack/user/response/todo_model.dart';
import 'package:self_stack/utils/constans.dart';

class TodoDetail extends StatelessWidget {
  final TodoModel todo;

  TodoDetail({required this.todo});

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTodoScreen(todo: todo),
                ),
              );
            },
            icon: Icon(Icons.edit, color: kwhiteModel),
          ),
          IconButton(
            onPressed: () {
              showDeleteConfirmation(context, todo);
            },
            icon: Icon(Icons.delete, color: kwhiteModel),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: kblackDark),
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
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: kwhiteModel),
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
