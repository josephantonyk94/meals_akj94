import 'package:flutter/material.dart';
import 'package:meals_app_akj94/screen/catagories.dart';
import 'package:meals_app_akj94/screen/category_meals.dart';
import 'package:meals_app_akj94/screen/meal_detail.dart';
import 'package:meals_app_akj94/screen/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Desi meals",
      //  home: Categories(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 224, 221, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMeals.routName: (ctx) => CategoryMeals(),
        MealDetail.routeName: (ctx) => MealDetail(),
      },
      onGenerateRoute: (settings) {
         print(settings.arguments);
      },onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (ctx)=>Categories());
    },
    );
  }
}
