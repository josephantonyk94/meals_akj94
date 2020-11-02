import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_akj94/dummy_category.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
Widget buildTextTitle(BuildContext context, String text){
  return  Container(
    child: Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
           buildTextTitle(context, 'Ingredients'),
            Container(padding: EdgeInsets.all(10
            ),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey,),
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,child: Text(selectedMeal.ingredients[index]),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),buildTextTitle(context,'steps' )
          ],
        ),
      ),
    );
  }
}
