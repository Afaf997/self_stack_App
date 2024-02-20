import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class TodoTextField extends StatelessWidget {
  const TodoTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        backgroundColor: kselfstackGreen,
        leading: IconButton(
          onPressed: () {
             Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,color: kwhiteModel,),),
        actions: [
          Icon(Icons.done, color: kwhiteModel,size: 30,),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: kgreymodel,fontSize: 30),
                border: InputBorder.none,
              ),
              style: TextStyle(color: kwhiteModel),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: kgreymodel,fontSize: 23),
                border: InputBorder.none,
              ),
              style: TextStyle(color: kwhiteModel),
            ),
          ),
        ],
      ),
    );
  }
}
