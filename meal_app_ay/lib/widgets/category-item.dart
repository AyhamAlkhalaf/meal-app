import 'package:flutter/material.dart';
import 'package:meal_app_ay/screens/category-screen-meal.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        // ignore: deprecated_member_use
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }



  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealscreen.routeName,
    arguments: {
      'id':id,
      'title':title,

    });


  }
}
