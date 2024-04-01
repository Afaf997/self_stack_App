import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/user/blocs/to_do/bloc/todo_bloc.dart';
import 'package:self_stack/user/pages/authentication_screens/network.dart/net_connection.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/navigation_bar.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/screen/todo_details_screen.dart';
import 'package:self_stack/user/response/todo_model.dart';
import 'package:self_stack/user/services/todo_service.dart';
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
    // todoBloc = TodoBloc()..add(RefreshEvent());
  }

  @override
  void dispose() {
    todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InternetConnectivitySystem(
      child: Scaffold(
        backgroundColor: kbackgroundmodel,
        appBar: AppBar(
          centerTitle: true,
        backgroundColor: kselfstackGreen,
        toolbarHeight: 80, 
        title: Text(
      "Notations",
      style: TextStyle(
          color: kwhiteModel, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
      onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavbarScreen()));
      },
      icon: Icon(
        Icons.arrow_circle_left_outlined,
        color: kwhiteModel,
      ),
        ),
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
                                        borderRadius: BorderRadius.circular(7)                                  
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        } else {
                          return Lottie.asset('assets/lottie/box.json',    width: 300,
          height: 300,
          fit: BoxFit.contain,);
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
            borderRadius: BorderRadius.circular(15),
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
                      'Create Notes',
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
      ),
    );
  }
}

