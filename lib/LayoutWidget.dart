import 'dart:ffi';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transactionList.dart';

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

  // define state
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = <Transaction>[];

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
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(labelText: 'Content'),
                  onChanged: (text) {
                    this.setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
                TextField(
                  controller: _amountController,
                  onChanged: (text) {
                    this.setState(() {
                      _transaction.amount = double.tryParse(text) ?? 0;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Amout (money)'),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                ButtonTheme(
                    height: 44,
                    child: FlatButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.showSnackBar(SnackBar(
                            content: Text(
                                'Content = ${_transaction.content}, money\'s amount = ${_transaction.amount}'),
                            duration: Duration(seconds: 3),
                          ));
                          setState(() {
                            _transactions.add(_transaction);
                            _transaction =
                                Transaction(content: '', amount: 0.0);
                            _contentController.text = '';
                            _amountController.text = '';
                          });
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('Insert Transaction'))),
                TransactionList(transactions: _transactions)
              ],
            )),
          ),
        ),
      ),
    );
  }
}
