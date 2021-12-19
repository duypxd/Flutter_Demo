import 'package:flutter/material.dart';
import '../widget/category_item.dart';
import '../models/fakeData.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
        children: FAKE_CATEGORY
            .map((eachCategory) => CategoryItem(category: eachCategory))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10));
  }
}
