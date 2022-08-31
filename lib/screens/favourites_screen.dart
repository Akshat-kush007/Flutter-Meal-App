import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meals_item.dart';

class FavouritesScreen extends StatelessWidget {
   List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return const Center(child: Text("Empty"));
    }else{
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (ctx,index){
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title, 
            imageUrl: favouriteMeals[index].imageUrl, 
            duration: favouriteMeals[index].duration, 
            complexity: favouriteMeals[index].complexity, 
            affordability: favouriteMeals[index].affordability,
            // delete: deleteThisItem,
            );
        },
        );
    }
  }
}