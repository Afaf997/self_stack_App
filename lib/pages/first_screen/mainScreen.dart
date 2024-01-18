import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';// Assuming it's 'constants.dart'

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundmodel,
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Center(
        child: Text('Your main content goes here'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, 
        selectedItemColor:selfstackGreen,
        unselectedItemColor: Colors.grey, 
        onTap: (index) {
            
        },
      ),
    );
  }
}