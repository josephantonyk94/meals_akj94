import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_akj94/model/meal.dart';
import 'package:meals_app_akj94/screen/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String title;

  MealItem(
      {@required this.id,@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});
final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName,arguments:id);
  }
  String getComplexity()
  {
    switch(complexity){
      case Complexity.Simple: return 'simple';
      break;
      case Complexity.Challenging:
        return 'challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable: return 'Affordable';
      break;
      case Affordability.Luxurious: return 'Luxurious';
      break;
      case Affordability.Pricey:return "pricey";
      break;
      default: return "unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: 300,
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.black54, fontSize: 28),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [Icon(Icons.schedule),SizedBox(width: 5,),Text('\$$duration')],),
                  Row(children: [Icon(Icons.work),SizedBox(width: 5,),Text(getComplexity())],),
                  Row(children: [Icon(Icons.attach_money),SizedBox(width: 5,),Text(affordabilityText)],),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

