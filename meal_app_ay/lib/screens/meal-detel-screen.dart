import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_ay/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';

  final Function toggleFavorites;
  final Function isFavorites;

  MealDetailScreen(this.toggleFavorites,this.isFavorites);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // نستقبل ال id
    final selecteMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selecteMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selecteMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(context,"Ingredients"),
            buildContainer( ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    selecteMeal.ingredients[index],
                    style: TextStyle(fontSize: 14,
                    color: Colors.black),
                  ),
                ),
              ),
              itemCount: selecteMeal.ingredients.length,
            ),),
            buildSectionTitle(context,"Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title: Text(selecteMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selecteMeal.steps.length,
            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => toggleFavorites(mealId) ,
        child: Icon(isFavorites(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context,String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  // ignore: missing_return
  Widget buildContainer (Widget child ){
   return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child:child,
    );

}

}
