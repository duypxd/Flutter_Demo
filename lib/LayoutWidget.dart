import 'dart:ffi';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transactionList.dart';
import 'package:intl/intl.dart';

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
  Transaction _transaction = Transaction(content: '', amount: 0.0, createdAt: DateTime.now());
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

  void _insertTransaction() {
    if (_transaction.content.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      return;
    } else {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
        content: Text(
            'Content = ${_transaction.content}, money\'s amount = ${_transaction.amount}, CreateAt = ${DateFormat.yMd().format(_transaction.createdAt)}'),
        duration: Duration(seconds: 3),
      ));
      setState(() {
        _transactions.add(_transaction);
        _transaction = Transaction(content: '', amount: 0.0, createdAt: DateTime.now());
        _contentController.text = '';
        _amountController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            IconButton(
                onPressed: () =>  _insertTransaction(),
                icon: Icon(Icons.add))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Transaction',
          child: Icon(Icons.add),
          onPressed: () => _insertTransaction(),
        ),
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
                TransactionList(transactions: _transactions)
              ],
            )),
          ),
        ),
      ),
    );
  }
}
