import 'package:flutter/material.dart';
import 'package:tree/new_die/die_screen.dart';
import 'package:tree/new_toata/toata_screen.dart';
import 'package:tree/watch/watch_screen.dart';

class home_layout extends StatefulWidget {
  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int currentIndex = 0; // Move currentIndex inside the state class
List<Widget> screen=[
  new_die(),
  totat_screen(),
  watch_screen(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IAM HERE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),body:screen[currentIndex] ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.location_on),
      ),
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
            icon: Icon(Icons.sanitizer_outlined),
            label: 'die',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessible),
            label: 'toata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms_rounded),
            label: 'watch',
          ),
        ],
      ),
    );
  }
}
