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

class _MyAppState extends State<StatefulWidgetMyApp>
    with WidgetsBindingObserver {

  late String _email = '';

  final emailEditingController = TextEditingController();
  // ---- life cycle ----
  // 1. initState
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    // print('Run initState()');
  }

  // 2. dispose ( is called when state/widget object is removed)
  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('Run dispose()');
  }

  // AppState
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        print('appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        print('appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('appLifeCycleState detached');
        break;
    }
  }

  // 3. build ( is triggered when we call setState())
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
