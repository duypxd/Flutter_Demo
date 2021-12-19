import 'package:flutter/material.dart';
import '../models/food.dart';

class DetailFoodPage extends StatelessWidget {
  static const String routeName = '/DetailFoodPage';

  Food? food;
  DetailFoodPage({this.food});

  @override
  Widget build(BuildContext context) {
    Map<String, Food>? arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Food>;
    this.food = arguments['food'];
    return Scaffold(
      appBar: AppBar(
        title: Text('${food?.name}'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: '${this.food?.urlImage}'),
          ),
          Text(
            'Ingreditions:',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: this.food?.ingredients?.length ?? 0,
                  itemBuilder: (context, index) {
                    String ingredient = this.food?.ingredients?[index] ?? '';
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                      title: Text(
                        ingredient,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
