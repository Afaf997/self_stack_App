import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/advisor/screens/navigation_screen.dart/navigation_admin.dart';
import 'package:self_stack/user/blocs/to_do/bloc/todo_bloc.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/custom_progress_bar.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/todo_details_screen.dart';
import 'package:self_stack/user/response/todo_model.dart';
import 'package:self_stack/user/services/todo_service.dart';
import 'package:self_stack/utils/constans.dart';
import 'package:lottie/lottie.dart';

class TodoAdmin extends StatefulWidget {
  TodoAdmin({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoAdmin> {
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
        toolbarHeight: 80, 
        title: Text(
          "To_Do List",
          style: TextStyle(
              color: kwhiteModel, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavbarAdmin()));
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: kwhiteModel,
          ),
        ),
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
          bloc: todoBloc,
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
                        return Center(
                          child: CircularProgressIndicator(
                            color: kselfstackGreen,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<TodoModel> todoList = snapshot.data!;

                        if (todoList.isEmpty) {
                          return Center(child: Lottie.asset('assets/lottie/box.json'));
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 90, left: 10, right: 10,top: 20),
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
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 7),
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kwhiteModel),                                    
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(' ${todo.title}',
                                                  style: TextStyle(
                                                      color: kwhiteModel)),
                                              SizedBox(height: 8),
                                              Text(
                                                '${todo.subtitle}',
                                                style: TextStyle(
                                                    color: kwhiteModel),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: CustomRoundProgressBar(
                                            percentage: todo.percentage,
                                            status: todo.status,
                                            todo: todo,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      } else {
                        return Lottie.asset('assets/lottie/box.json');
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
                            style: TextStyle(color: kwhiteModel),
                          decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(color: kwhiteModel,fontSize: 17)),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: subtitleController,
                                    style: TextStyle(color: kwhiteModel),
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
