import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_list/FoodApp/screens/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Itim',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontSize: 18, fontFamily: 'Sunshiney', color: Colors.white),
              bodyText1: TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
              bodyText2: TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Now Food'),
        ),
        body: SafeArea(child: CategoriesPage()),
      ),
    );
  }
}
