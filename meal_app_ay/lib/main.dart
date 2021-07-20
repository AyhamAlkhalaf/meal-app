import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/category-screen-meal.dart';
import './screens/filters_screen.dart';
import './screens/meal-detel-screen.dart';
import './screens/tabs_screen.dart';
import './widgets/category-item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters ={
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  List<Meal> _availabelMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

void _setFilters(Map<String, bool>  _filterData){

    setState(() {
      _filters = _filterData;

      _availabelMeals = DUMMY_MEALS .where((meal) {
       if(_filters['gluten'] && !meal.isGlutenFree){
         return false;
       };
       if(_filters['lactose'] && !meal.isLactoseFree){
         return false;
       }
       if(_filters['vegan' ] && !meal.isVegan){
         return false;
       }
       if(_filters['vegetarian'] && !meal.isVegetarian){
         return false;
       }
       return true;
      }).toList();
    });

}
void _toggleFavorite(String mealId){
final existingIndex = _favoriteMeals .indexWhere((meal) => meal.id == mealId );
if (existingIndex >= 0){
  setState(() {
    _favoriteMeals.removeAt(existingIndex);
  });
}
else {
  setState(() {
    _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
  });
}

}
bool  _isMealFavorits(String id){
  return _favoriteMeals.any((meal) => meal.id == id );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          // ignore: deprecated_member_use
          body1: TextStyle(
         color:Color.fromRGBO(20, 50, 50, 1),
          ),
          // ignore: deprecated_member_use
          body2: TextStyle(color:Color.fromRGBO(20, 50, 50, 1),
          ),
          // ignore: deprecated_member_use
          title: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed",
          ),
        )


      ),
      //home: MyHomePage(),
      routes: {
        '/':(context) =>TabsScreen(_favoriteMeals ),
        CategoryMealscreen.routeName :(context) => CategoryMealscreen(_availabelMeals),
        MealDetailScreen.routeName :(context) => MealDetailScreen(_toggleFavorite,_isMealFavorits),
        FiltersScreen.routeName:(context) => FiltersScreen(_setFilters,_filters),
      },


    );
  }
}


