import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_akj94/widget/meal_item.dart';

import '../dummy_category.dart';

class CategoryMeals extends StatelessWidget {
  static const routName = '/category-meals';

  // final String catId;
  // final String catTitle;
  // CategoryMeals(this.catId, this.catTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    final catMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(id: catMeals[index].id,
                title: catMeals[index].title,
                imageUrl: catMeals[index].imageUrl,
                duration: catMeals[index].duration,
                complexity: catMeals[index].complexity,
                affordability: catMeals[index].affordability);
          },
          itemCount: catMeals.length,
        ));
  }
}
