import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/theme.dart';

import '../models/meals.dart';
import '../widgets/my_drawer.dart';

class BottomTabsScreen extends StatefulWidget {
  
  List<Meal> favouriteMeals;
  BottomTabsScreen(this.favouriteMeals);
  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {

  List<Widget> _pages=[];
  @override
  void initState() {
    _pages=[CategoriesScreen(),FavouritesScreen(widget.favouriteMeals)];
    super.initState();
  }

  int _selectedItemIndex=0;
  void _selectedItem(int index){
    setState(() {
      _selectedItemIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Meal App"),
      actions: [
        IconButton(onPressed: (){
          customTheme.toggleTheme();
        }, icon: customTheme.themeMode==ThemeMode.light ? 
        Icon(Icons.dark_mode_rounded):
        Icon(Icons.sunny,) 
        )
      ],
      ),
      body: _pages[_selectedItemIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedItem,
        currentIndex: _selectedItemIndex,
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.grey,
        // backgroundColor: Theme.of(context).primaryColor,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.line_weight_sharp),label:"Categories"),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),label: "Favourites")
        ],
      ),
    );
  }
}