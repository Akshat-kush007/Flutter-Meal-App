import 'package:flutter/material.dart';
import 'package:meal_app/Dummy_data/dummy_data%20.dart';
import 'package:meal_app/models/filters.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/bottomTabs_screen.dart';
import 'package:meal_app/screens/details_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This varible is used to filter checks.
  Filters _filters = new Filters();
  //This varible will store the filtered meals according to above mention filters apply
  List<Meal> _filteredMeals = DUMMY_MEALS;
  //Function to to update the filteredMeals accoding filter check
  void upDateFilters(Filters newValue) {
    setState(() {
      _filters = newValue;
      _filteredMeals = DUMMY_MEALS.where((mealItem) {
        if (_filters.checkGluten && !mealItem.isGlutenFree) {
          return false;
        }
        if (_filters.checkVegan && !mealItem.isVegan) {
          return false;
        }
        if (_filters.checkVegetarian && !mealItem.isVegetarian) {
          return false;
        }
        if (_filters.checkLactose && !mealItem.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  //This list stores favourites meals for favourites screen
  List<Meal> _favouriteMeals = [];
  void _upDateFavourite(String mealId) {
    int indexExist = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (indexExist >= 0) {
        //removing
        _favouriteMeals.removeAt(indexExist);
      } else {
        //adding
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    });
  }

  //This toggle function return the status of meal in favurites
  bool _toggleFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(
        "\ngluten : ${_filters.checkGluten}\nVegen : ${_filters.checkVegan}\nVegetarian : ${_filters.checkVegetarian}\nLactose : ${_filters.checkLactose}\n");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.orange,
          
          // canvasColor: Color.fromARGB(225, 43, 230, 255)
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                // titleLarge: TextStyle(
                //   fontSize: 24,
                //   fontFamily: 'Roboto'
                // ),
                // titleMedium: TextStyle(
                //   fontSize: 24,
                //   fontFamily: 'Roboto'
                // ),
                // titleSmall: TextStyle(
                //   fontSize: 24,
                //   fontFamily: 'Roboto'
                // ),
              )),
      routes: {
        // '/':(ctx)=>TabsScreen(),
        '/': (ctx) => BottomTabsScreen(_favouriteMeals),
        MealsScreen.routName: (ctx) =>
            MealsScreen(filteredMeals: _filteredMeals),
        DetailsScreen.routeName: (context) => DetailsScreen(
              favouriteMeals: _favouriteMeals,
              upDateFavourite: _upDateFavourite,
              toggleFavourite: _toggleFavourite,
            ),
        FiltersScreen.routName: (context) => FiltersScreen(
              filters: _filters,
              function: upDateFilters,
            ),
      },
      // home: CategoriesScreen(),
    );
  }
}
