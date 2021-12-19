import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App with navigation',
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        body: Center(
          child: Text(
            'Food App with navigation',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
