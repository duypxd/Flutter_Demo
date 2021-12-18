import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

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
            child: Row(
              children: <Widget>[
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      transactions[index].content,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Date: ${DateFormat.yMd().format(transactions[index].createdAt)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child:Text(
                      'Price: ${transactions[index].amount}\$',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                  ],
                ))
              ],
            ),
            // child: ListTile(
            //   leading: const Icon(
            //     Icons.alarm,
            //     color: Colors.white,
            //   ),
            //   title: Text(
            //     transactions[index].content,
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   subtitle: Text(
            //     'Price: ${transactions[index].amount}',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onTap: () {
            //     print('tab me');
            //   },
            // ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // return Column(children: _buildWidgetList());
    return Container(height: 500, child: _buildWidgetList());
  }
}
