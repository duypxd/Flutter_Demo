import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddLibToFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Text(
            'See result here: ${DateFormat('yyyy/mm/dd').format(now)}',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
