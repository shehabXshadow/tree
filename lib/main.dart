import 'package:flutter/material.dart';
import 'package:tree/home_layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_layout(),
      debugShowCheckedModeBanner: false, // This line hides the debug banner
    );
  }
}
