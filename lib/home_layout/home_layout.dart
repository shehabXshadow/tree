import 'package:flutter/material.dart';
import 'package:tree/new_die/Datebase.dart';
import 'package:tree/new_toata/loaction_screen.dart';
import 'package:tree/watch/watch_screen.dart';

class home_layout extends StatefulWidget {
  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int currentIndex = 0;
  List<Widget> screens = [
    NewDie(),
    LocationScreen(),
    WatchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Irrigation System',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'DATEBASE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: 'LocationScreen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms_rounded),
            label: 'watch',
          ),
        ],
        selectedItemColor: Colors.green, // Set the selected item color to green
        unselectedItemColor: Colors.black, // Set the unselected item color to black
      ),
    );
  }
}

