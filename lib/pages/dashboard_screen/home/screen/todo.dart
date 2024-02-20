import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/todo_textscreen.dart';
import 'package:self_stack/utils/constans.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  // List<TodoItem> todoItems = [];

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: kbackgroundmodel,
    appBar: AppBar(
     leading: IconButton(
          onPressed: () {
             Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,color: kwhiteModel,),),
      backgroundColor: kselfstackGreen,
      title: Text(
        'Todo List',
        style: TextStyle(color: kwhiteModel, fontSize: 23),
      ),
    ),
    body: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: kblackDark,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Public',
                        style: TextStyle(
                          color: kwhiteModel,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: kblackDark, 
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Private',
                        style: TextStyle(
                          color: kwhiteModel,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            // itemCount: todoItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                // title: Text(todoItems[index].title),
                // subtitle: Text(todoItems[index].subtitle),
              );
            },
          ),
        ),
      ],
    ),
    floatingActionButton: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
        ),
        color: kblackDark,
      ),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TodoTextField()),
          );
        },
        child: Icon(
          Icons.add,
          color: kwhiteModel,
        ),
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}
}