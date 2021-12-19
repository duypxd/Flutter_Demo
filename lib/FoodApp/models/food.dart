import 'dart:math';
import 'category.dart';
import 'package:flutter/cupertino.dart';

class Food {
  int? id;
  String name;
  String urlImage;
  Duration duration;
  Complexity? complexity;
  // one foods has many ingredients
  List<String>? ingredients = [];
  // refrence: 1 category has many Foods
  int? categoryId;
  // Constructor
  Food(
      {required this.urlImage,
      required this.name,
      required this.duration,
      this.complexity,
      this.categoryId,
      this.ingredients}) {
    this.id = Random().nextInt(1000);
  }
}

enum Complexity {
  Simple,
  Medium,
  Hard,
}
