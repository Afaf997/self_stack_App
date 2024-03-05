import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/todo.dart';
import 'package:self_stack/user/response/todo_model.dart';
import 'package:self_stack/user/services/todo_put.dart';
import 'package:self_stack/utils/constans.dart';

class EditTodoScreen extends StatefulWidget {
  final TodoModel todo;

  EditTodoScreen({required this.todo});

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  

  @override
  void initState() {
    super.initState();
    titleController.text = widget.todo.title;
    subtitleController.text = widget.todo.subtitle;
  }

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
        title: Text('Edit Todo', style: TextStyle(color: kwhiteModel)),
        actions: [
          IconButton(
            onPressed: () {
              saveChanges(widget.todo.id);
            },
            icon: Icon(Icons.save, color: kwhiteModel),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: kwhiteModel),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kwhiteModel),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kwhiteModel),
                ),
              ),
              style: TextStyle(color: kwhiteModel),
            ),
            SizedBox(height: 8),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                labelText: 'Subtitle',
                labelStyle: TextStyle(color: kwhiteModel),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kwhiteModel),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kwhiteModel),
                ),
              ),
              style: TextStyle(color: kwhiteModel), 
            ),
          ],
        ),
      ),
    );
  }

  void saveChanges(todo) async{
       try {
                await PutTodoServices().PutTodogetDetails(todo,titleController.text,subtitleController.text);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoScreen()));
              } catch (error) {
                print('Error deleting todo: $error');
              }
  }
}
