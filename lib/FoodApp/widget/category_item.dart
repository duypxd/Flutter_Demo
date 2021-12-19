import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/category.dart';
import '../screens/./foods_page.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({required this.category});
  @override
  Widget build(BuildContext context) {
    Color _color = this.category.color;
    return InkWell(
      onTap: () => {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodsPage(
        //           category: this.category,
        //         )))
        Navigator.pushNamed(context, FoodsPage.routeName,
            arguments: {'category': category})
      },
      splashColor: Colors.deepPurple,
      child: Container(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(this.category.content,
                  style: Theme.of(context).textTheme.headline6),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_color.withOpacity(0.8), _color],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            color: _color,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
