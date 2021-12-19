import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  String content;
  double amount;
  DateTime createdAt;
  // Constructor
  Transaction({required this.content, required this.amount, required this.createdAt});

  @override 
  String toString(){
    return 'Content: $content - Amount: $amount - Date: ${DateFormat.yMMMd(createdAt)}';
  }
}
