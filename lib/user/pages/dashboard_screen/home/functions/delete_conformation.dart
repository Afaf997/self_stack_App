import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/todo.dart';
import 'package:self_stack/user/response/todo_model.dart';
import 'package:self_stack/user/services/todo_delete.service.dart';
import 'package:self_stack/utils/constans.dart';

Future<void> showDeleteConfirmation(BuildContext context, TodoModel todo) async {

  
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kblackDark,
        title: Text('Confirm Delete', style: TextStyle(color: kwhiteModel)),
        content: Text('Are you sure you want to delete this todo?',
            style: TextStyle(color: kwhiteModel)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel', style: TextStyle(color: kwhiteModel)),
          ),
          TextButton(
            onPressed: () async {
              try {
                await DeleteTodoServices().DeleteTodogetDetails(todo.id);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoScreen()));
              } catch (error) {
                print('Error deleting todo: $error');
              }
            },
            child: Text('Delete', style: TextStyle(color: kredtheme)),
          ),
        ],
      );
    },
  );
}
