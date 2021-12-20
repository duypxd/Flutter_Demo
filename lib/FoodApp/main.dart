import 'dart:ui';
import 'package:flutter/material.dart';

import 'screens/categories_page.dart';
import 'screens/foods_page.dart';
import 'screens/detail_food_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/FoodsPage': (context) => FoodsPage(),
        '/CategoriesPage': (context) => CategoriesPage(),
        '/DetailFoodPage': (context) => DetailFoodPage(),
      },
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
          title: Text('VinMart'),
        ),
        body: SafeArea(child: CategoriesPage()),
      ),
    );
  }
}