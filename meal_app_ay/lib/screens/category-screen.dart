import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_ay/dummy_data.dart';
import 'package:meal_app_ay/widgets/category-item.dart';




class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: GridView(
        padding:EdgeInsets.all(15),
        children: DUMMY_CATEGORIES.map((catDate) =>
          CategoryItem(catDate.id,catDate.title,catDate.color),

        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
      ),
    );
  }
}
