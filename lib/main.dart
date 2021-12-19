import 'package:flutter/material.dart';
import 'package:todo_list/FoodApp/screens/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food App'),
        ),
        body: SafeArea(child: CategoriesPage()),
      ),
    );
  }
}
