import 'package:flutter/material.dart';

class StudentsBatchScreen extends StatelessWidget {
  const StudentsBatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 203, 86),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 82, 203, 86),
        title: const Text(
          'Students Batch',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              width: screenWidth - 40, // Adjusted to screen width
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: index == 0 ? 40.0 : 8.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 43, 43),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar_image.png'),
                ),
                title: Text('Student $index',
                    style: const TextStyle(color: Colors.white)),
                subtitle: Text('Details about Student $index'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => StatusOfStudent(),
                  //   ),
                  // );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
