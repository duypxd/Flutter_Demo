import 'package:flutter/material.dart';

class MyAppStatelessWidget extends StatelessWidget {
  late String name;
  late int age;

  MyAppStatelessWidget({required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            HeaderRightWidget(title: 'Notification', message: 'My message',),
          ],
        ),
        body: Center(
          child: Text(
            'Hello $name - $age',
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}


// Button
class HeaderRightWidget extends StatelessWidget {
  dynamic title;
  dynamic message;

  HeaderRightWidget({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title:  Text('$title'),
          content:  Text('$message'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      icon: const Icon(Icons.add_alert),
    );
  }
}
