import 'package:flutter/material.dart';

class DomainPage extends StatefulWidget {
  const DomainPage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<DomainPage> {
  List<ContainerData> containerDataList = [];
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.green,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(55.0),
            bottomLeft: Radius.circular(55.0),
          ),
        ),
        title: const Text(
          'Domain Students',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: containerDataList.length,
        itemBuilder: (context, index) {
          return _buildImageContainer(
            containerDataList[index].title,
            containerDataList[index].text,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child:  Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildImageContainer(String title, String description) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 66, 65, 65), 
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Image.asset(
            'assets/image/domain.png',
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, 
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context) async {
    String text = '';

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Container',style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromARGB(255, 56, 56, 56), // Set background color of the dialog
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Set border radius of the dialog
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Adjust the size of the dialog
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: 'Text',labelStyle: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  text = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addNewContainer(text);
              },
              child: const Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set button color
              ),
            ),
          ],
        );
      },
    );
  }

  void _addNewContainer(String text) {
    setState(() {
      containerDataList.add(ContainerData(title: text, text: text));
    });
  }
}

class ContainerData {
  final String title;
  final String text;

  ContainerData({required this.title, required this.text});
}
