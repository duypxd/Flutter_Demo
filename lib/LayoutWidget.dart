import 'dart:ffi';

import 'package:flutter/material.dart';

class LayoutWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLayoutWidget();
  }
}

class _MyLayoutWidget extends State<LayoutWidget> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  late double _amount = 0;
  late String _content = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  // 2. dispose ( is called when state/widget object is removed)
  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _contentController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
                onChanged: (text) {
                  this.setState(() {
                    _content = text;
                  });
                },
              ),
              TextField(
                controller: _amountController,
                onChanged: (text) {
                  this.setState(() {
                    _amount = double.tryParse(text) ?? 0;
                  });
                },
                decoration: InputDecoration(labelText: 'Amout (money)'),
              ),
              FlatButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.showSnackBar(SnackBar(
                      content: Text(
                          'Content = $_content, money\'s amount = $_amount'),
                      duration: Duration(seconds: 3),
                    ));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Insert Transaction'))
            ],
          )),
        ),
      ),
    );
  }
}
