import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tree/new_die/die_screen.dart'; // Import necessary files
import 'package:tree/new_toata/toata_screen.dart'; // Import necessary files
import 'package:tree/watch/watch_screen.dart'; // Import necessary files

class home_layout extends StatefulWidget {
  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int currentIndex = 0;
  List<Widget> screens = [
    NewDie(),
    totat_screen(),
    watch_screen(),
  ];

  void getLocation() async {
    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Do something with the position
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IAM HERE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getLocation();
        },
        child: Icon(Icons.location_on),
        tooltip: 'Get Location', // Tooltip text
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
            icon: Icon(Icons.account_balance_wallet),
            label: 'DATEBASE',
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