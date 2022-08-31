import 'package:flutter/material.dart';
import 'package:meal_app/models/filters.dart';
import 'package:meal_app/widgets/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = "/filters-screen";
  Filters filters;
  Function function;
  FiltersScreen({
    required this.filters,
    required this.function,
    });
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  @override
  void initState() {
    _isGlutenFree=widget.filters.checkGluten;
    _isVegan=widget.filters.checkVegan;
    _isVegetarian=widget.filters.checkVegetarian;
    _isLactoseFree=widget.filters.checkLactose;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Column(
        children: [
          Container(
            height: 20,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Text(
              'Selece Meal Prefrences',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SwitchListTile(
                    value: _isGlutenFree,
                    title: Text("GlutenFree"),
                    subtitle: Text("Set Meals to GlutenFree"),
                    onChanged: (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    value: _isVegan,
                    title: Text("Vegan"),
                    subtitle: Text("Set Meals to Vegan"),
                    onChanged: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    }),
                SwitchListTile(
                    value: _isVegetarian,
                    title: Text("Vegetarian"),
                    subtitle: Text("Set Meals to Vegetarian"),
                    onChanged: (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    }),
                SwitchListTile(
                    value: _isLactoseFree,
                    title: Text("LactoseFree"),
                    subtitle: Text("Set Meals to LactoseFree"),
                    onChanged: (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    }),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton.icon(onPressed: (){
                            widget.filters.checkGluten=_isGlutenFree;
                            widget.filters.checkVegan=_isVegan;
                            widget.filters.checkVegetarian=_isVegetarian;
                            widget.filters.checkLactose=_isLactoseFree;
                            widget.function(widget.filters);

                      }, icon: Icon(Icons.check), 
                      label: Text("Save Changes"),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).accentColor,
                      ),
                      ),
                    )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
