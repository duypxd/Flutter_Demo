import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList({required this.transactions});

  List<Widget> _buildWidgetList() {
    int index = 0;
    return transactions.map((e) {
      index++;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: (index - 1) % 2 == 0 ? Colors.lightBlue : Colors.greenAccent,
        child: ListTile(
          leading: const Icon(
            Icons.alarm,
            color: Colors.white,
          ),
          title: Text(
            e.content,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            'Price: ${e.amount}',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            print('tab me');
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildWidgetList());
  }
}
