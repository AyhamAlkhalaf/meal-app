import 'package:flutter/material.dart';
import 'package:meal_app_ay/widgets/meal-item.dart';
import 'package:meal_app_ay/models/meal.dart';

class CategoryMealscreen extends StatefulWidget {
  static const routeName = 'category_meals';

final List<Meal> availabelMeals;


CategoryMealscreen(this.availabelMeals);

  @override
  _CategoryMealscreenState createState() => _CategoryMealscreenState();
}

class _CategoryMealscreenState extends State<CategoryMealscreen> {

  String categoryTitle;
  List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayedMeal =widget.availabelMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            duration : displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,

          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId );
    });

  }

}
