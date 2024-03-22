import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/domain.dart'; // Import your model class here
import 'package:self_stack/utils/constans.dart'; // Import your constants here

class DomainStudent extends StatelessWidget {
  final Domain domain; // Pass the Domain object to this screen

  const DomainStudent({Key? key, required this.domain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kselfstackGreen,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Use pop to go back to the previous screen
          },
          icon: Icon(Icons.arrow_back, color: kwhiteModel),
        ),
        toolbarHeight: 90,
        backgroundColor: kselfstackGreen,
        title: Text(
          'Domain Students',
          style: TextStyle(
            color: kwhiteModel,
            fontSize: 27,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: kwhiteModel),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemCount: domain.students?.length ?? 0,
            itemBuilder: (context, index) {
              final student = domain.students![index]; 
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
                child: ListTile(
                  tileColor: Colors.black, 
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(student?.image ?? ''), 
                  ),
                  title: Text(
                    student?.name ?? 'No Name', 
                    style: TextStyle(color: kwhiteModel),
                  ),
                  subtitle: Text(
                    student?.email ?? 'No Email', 
                    style: TextStyle(color: kwhiteModel),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
