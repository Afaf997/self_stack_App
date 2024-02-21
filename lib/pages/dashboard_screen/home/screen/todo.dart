import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/to_do/bloc/todo_bloc.dart';
import 'package:self_stack/pages/dashboard_screen/home/screen/todo_details_screen.dart';
import 'package:self_stack/pages/dashboard_screen/home/widget/todo_fetch.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:self_stack/services/todo_service.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:lottie/lottie.dart';

class TodoScreen extends StatefulWidget {
   TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();


  bool isPublic = true;

  late TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();
    todoBloc = TodoBloc()..add(RefreshEvent());
  }

  @override
  void dispose() {
    todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        backgroundColor: kselfstackGreen,
        title: Text(
          "To_Do List",
          style: TextStyle(
              color: kwhiteModel, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: kwhiteModel,
            )),
        actions: [
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
      body: BlocProvider(
        create: (context) => todoBloc,
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc:todoBloc,
          builder: (context, state) {
            if (state is RefreshState) {
              return RefreshIndicator(
                onRefresh: () async {
                  todoBloc.add(RefreshEvent()); 
                },
                child: Expanded(
                 child: FutureBuilder<List<TodoModel>?>(
                    future: state.todoListFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator(color: kselfstackGreen,));
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<TodoModel> todoList = snapshot.data!;
                        if (todoList.isEmpty) {
                          return Lottie.asset('assets/lottie/box.json');
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 90, left: 10, right: 10),
                            child: ListView.builder(
                              itemCount: todoList.length,
                              itemBuilder: (context, index) {
                                TodoModel todo = todoList[index];
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TodoDetailScreen(todo: todo),
                                    ),
                                  ),
                                  child: Container(
                                    child: Dismissible(
                                      key: Key(todo.id.toString()),
                                      background: Container(
                                        color: Colors.red,
                                        alignment: Alignment.centerLeft,
                                        child:
                                            Icon(Icons.delete, color: Colors.white),
                                      ),
                                      secondaryBackground: Container(
                                        color: Colors.green,
                                        alignment: Alignment.centerRight,
                                        child:
                                            Icon(Icons.check, color: Colors.white),
                                      ),
                                      onDismissed: (direction) {
                                        if (direction ==
                                            DismissDirection.startToEnd) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text('Completed: ${todo.title}'),
                                            ),
                                          );
                                        } else if (direction ==
                                            DismissDirection.endToStart) {
                                          // Swipe left (delete action)
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text('Deleted: ${todo.title}'),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(vertical: 7),
                                        padding: EdgeInsets.all(13),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: kwhiteModel),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Title: ${todo.title}',
                                                style:
                                                    TextStyle(color: kwhiteModel)),
                                            SizedBox(height: 8),
                                            Text(
                                              'Subtitle: ${todo.subtitle}',
                                              style: TextStyle(color: kwhiteModel),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: kselfstackGreen,
                ),
              );
            }
          },
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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: kblackDark,
                  title: Text(
                    'Create Task',
                    style: TextStyle(color: kwhiteModel),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(color: kwhiteModel)),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: subtitleController,
                          decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: TextStyle(color: kwhiteModel)),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: kwhiteModel),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await TodoServices().PostTodoDetails(
                            titleController.text,
                            subtitleController.text,
                            isPublic,
                          );
                          todoBloc.add(RefreshEvent()); 
                          Navigator.pop(context);
                        } catch (error) {
                          print('Error: $error');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(color: kwhiteModel),
                      ),
                    ),
                  ],
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
