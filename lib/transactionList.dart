import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList({required this.transactions});

  ListView _buildWidgetList() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: (index - 1) % 2 == 0 ? Colors.lightBlue : Colors.green,
            child: ListTile(
              leading: const Icon(
                Icons.alarm,
                color: Colors.white,
              ),
              title: Text(
                transactions[index].content,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Price: ${transactions[index].amount}',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                print('tab me');
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // return Column(children: _buildWidgetList());
    return Container(height: 500, child: _buildWidgetList());
  }
}
