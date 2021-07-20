import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_ay/screens/category-screen-meal.dart';
import 'package:meal_app_ay/models/meal.dart';
import 'package:meal_app_ay/screens/meal-detel-screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;


  const MealItem({
     this.id,
     this.categories,
     this.title,
     this.imageUrl,
     this.ingredients,
     this.steps,
     this.duration,
     this.complexity,
     this.affordability,
     this.isGlutenFree,
     this.isLactoseFree,
     this.isVegan,
     this.isVegetarian,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default:
        return "Un Known";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Un Known";
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 8,
                      ),
                      Text(" $duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 8,
                      ),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 8,
                      ),
                      Text("$affordabilityText"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
      arguments: id,
    ).then((result){
   //   if (result !=null ) removeItem(result);

    });
  }
}

