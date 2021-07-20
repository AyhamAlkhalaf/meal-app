import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_app_ay/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';


  final  Function saveFilters;
final Map<String, bool> CurrentFilter;

  FiltersScreen(this.saveFilters,this.CurrentFilter);


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;


  @override
  initState() {
   _glutenFree = widget.CurrentFilter['gluten'];
   _lactoseFree = widget.CurrentFilter['lactose'];
   _vegan = widget.CurrentFilter['vegetarian'];
   _vegetarian = widget.CurrentFilter['vegan'];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
           onPressed:(){
              final Map<String, bool> selectedFilters = {
                'gluten' : _glutenFree ,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegetarian' : _vegetarian,
              };

              widget.saveFilters(selectedFilters);
           },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection ",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-free',
                  'only include gluten meals',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'lactose-Free',
                  'only include lactose-Free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'vegetarian',
                  'only include vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'vegan',
                  'only include vegan meals',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
}
