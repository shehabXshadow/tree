import 'package:flutter/material.dart';

class WatchScreen extends StatefulWidget {
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  bool _isExpanded1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded1 = !_isExpanded1;
                    print(_isExpanded1 ? 'On' : 'Off');
                  });
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _isExpanded1 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      _isExpanded1 ? 'On' : 'Off',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 165.0), // Adjusted top padding
              child: Text(
                'How to use app',
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



