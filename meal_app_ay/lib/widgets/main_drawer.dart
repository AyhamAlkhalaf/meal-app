import 'package:flutter/material.dart';
import 'package:meal_app_ay/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.grey,
            child: Center(
              child: Text(
                'COOKING APP',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color:Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meal", Icons.restaurant, () {Navigator.of(context).pushReplacementNamed('/');}),
          SizedBox(
            height: 20,
          ),
          buildListTile('Filters', Icons.settings, () {Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
