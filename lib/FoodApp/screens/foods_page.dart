import 'package:flutter/material.dart';

import '../screens/detail_food_page.dart';
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

    //Filter foods of from category
    List<Food> foods =
        FAKE_FOODS.where((food) => food.categoryId == category?.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('VinMart from category'),
      ),
      body: Center(
        child: Center(
          child: foods.length > 0
              ? ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    Food food = foods[index];
                    return InkWell(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              clipBehavior: Clip.hardEdge,
                              child: Center(
                                child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    image: food.urlImage),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.timer,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Text(
                                      '${food.duration.inMinutes} mintunes',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    )
                                  ],
                                )),
                          ),
                          Positioned(
                            top: 30,
                            right: 30,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '${food.complexity.toString().split('.').last}',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, DetailFoodPage.routeName,
                            arguments: {'food': food});
                      },
                    );
                  })
              : Text(
                  'No Food Found!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
        ),
      ),
    );
  }
}
