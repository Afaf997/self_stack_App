import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/todo_details_screen.dart';
import 'package:self_stack/pages/dashboard_screen/home/widget/todo_fetch.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:self_stack/services/todo_service.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:lottie/lottie.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  bool isPublic = true;

  late Future<List<TodoModel>> todoListFuture;

  @override
  void initState() {
    super.initState();
    todoListFuture = getTaskDetailsService.GetTodogetDetails();
  }

  Future<void> _refresh() async {
    setState(() {
      todoListFuture = getTaskDetailsService.GetTodogetDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        backgroundColor: kselfstackGreen,
          title:  Text(
                      "To_Do List",
                      style: TextStyle(
                          color: kwhiteModel,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: IconButton(onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back,color: kwhiteModel,)),
                actions:[
                       GestureDetector(
                      onTap: () {
                        setState(() {
                          isPublic = !isPublic;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: isPublic ? kselfstackGreen : kselfstackGreen,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Icon(
                          isPublic ? Icons.public : Icons.lock,
                          color: kwhiteModel,
                        ),
                      ),
                    ),
                ],   
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Expanded(
          child: FutureBuilder<List<TodoModel>>(
            future: todoListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<TodoModel> todoList = snapshot.data!;
                if (todoList.isEmpty) {
                  return Lottie.asset('assets/lottie/box.json');
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 90,left: 10,right: 10),
                    child: ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        TodoModel todo = todoList[index];
                     return GestureDetector(
                                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                                builder: (context) => TodoDetailScreen(todo: todo),
                    ),
                                  ),
                                  child: Container(
                    width: double.infinity,
                    child: Dismissible(
                                key: Key(todo.id.toString()), // Provide a unique key for each item
                                background: Container(
                                  color: Colors.red, // Swipe left background color (delete action)
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.delete, color: Colors.white),
                                ),
                                secondaryBackground: Container(
                                  color: Colors.green, // Swipe right background color (complete action)
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.check, color: Colors.white),
                                ),
                                onDismissed: (direction) {
                                  if (direction == DismissDirection.startToEnd) {
                    // Swipe right (complete action)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                            content: Text('Completed: ${todo.title}'),
                      ),
                    );
                                  } else if (direction == DismissDirection.endToStart) {
                    // Swipe left (delete action)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                            content: Text('Deleted: ${todo.title}'),
                      ),
                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                    border: Border.all(color: kwhiteModel),
                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title: ${todo.title}', style: TextStyle(color: kwhiteModel)),
                      SizedBox(height: 8),
                      Text('Subtitle: ${todo.subtitle}', style: TextStyle(color: kwhiteModel),
                       maxLines: 1, 
                                  overflow: TextOverflow.ellipsis,),
                    ],
                                  ),
                                ),
                    ),
                                  ),
                                );
                                
                      },
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          color: kblackDark,
        ),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: subtitleController,
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                await TodoServices().PostTodoDetails(
                                  titleController.text,
                                  subtitleController.text,
                                  isPublic,
                                );
                                _refresh();
                
                                Navigator.pop(context);
                              } catch (error) {
                                print('Error: $error');
                              }
                            },
                            child: Text('Save'),
                          ),
                          SizedBox(width: 8.0),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
