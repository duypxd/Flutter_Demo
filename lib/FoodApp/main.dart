import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '././FoodApp/blocs/app_bloc_observer.dart';
import '././FoodApp/blocs/theme_bloc.dart';
import '././FoodApp/screens/categories_page.dart';
import '././FoodApp/screens/foods_page.dart';
import '././FoodApp/screens/detail_food_page.dart';

void main() => {
      BlocOverrides.runZoned(() => runApp(MyApp()),
          blocObserver: AppBlocObserver()),
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/FoodsPage': (context) => FoodsPage(),
          '/CategoriesPage': (context) => CategoriesPage(),
          '/DetailFoodPage': (context) => DetailFoodPage(),
        },
        // theme: theme,
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Itim',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontSize: 18, fontFamily: 'Sunshiney', color: Colors.white),
                bodyText1: TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
                bodyText2: TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
              ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('VinMart'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.wb_sunny, size: 24),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ],
          ),
          body: SafeArea(child: CategoriesPage()),
        ),
      );
    });
  }
}
