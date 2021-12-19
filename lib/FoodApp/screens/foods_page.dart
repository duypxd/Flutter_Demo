import 'package:flutter/material.dart';

import '../models/fakeData.dart';
import '../models/food.dart';
import '../models/category.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  Category? category;
  FoodsPage({this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category>? arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>?;
    this.category = arguments!['category'];
    ['category'];

    //Filter foods of from category
    List<Food> foods = FAKE_FOODS.where((food) => food.categoryId == category?.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from category'),
      ),
      body: Center(
        child: Text(
          'This show ${category?.content}',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
