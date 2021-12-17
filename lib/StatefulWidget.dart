import 'package:flutter/material.dart';

class StatefulWidgetMyApp extends StatefulWidget {
  late String name;
  late int age;

  StatefulWidgetMyApp({required this.name, required this.age});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<StatefulWidgetMyApp> {
  late String _email = '';

  final emailEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: TextField(
                controller: emailEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _email = text;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(16))),
                    labelText: 'Enter your email'),
              ),
            ),
            Text(
              'Full name: ${widget.name}',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              'Email: $_email',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              'Age: ${widget.age}',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        )),
      ),
    );
  }
}
