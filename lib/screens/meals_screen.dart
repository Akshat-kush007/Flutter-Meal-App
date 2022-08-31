import 'package:flutter/material.dart';
import 'package:meal_app/Dummy_data/dummy_data%20.dart';
import 'package:meal_app/models/meals.dart';

import '../widgets/meals_item.dart';

class MealsScreen extends StatefulWidget {
  static const routName ='/meals-Screen';
  List<Meal> filteredMeals;
  MealsScreen({required this.filteredMeals});
  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {


late List<Meal> thisCategoryMeals;
 String? title;
  @override
  void initState() {
    //setData
    //here we cannot able to use it because this 
    //function is using the contest which is not 
    //generates at a time of init state in lifecycle
    super.initState();
  }
  //therefore we will use another lifecycle method =>
  @override
  void didChangeDependencies() {
    setData();
    super.didChangeDependencies();
  }
void setData(){
  final routsArgs=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final String? id=routsArgs['id'];
    title=routsArgs['title'];
    thisCategoryMeals= widget.filteredMeals.where((meal){
       return meal.categories.contains(id); 
      }
    ).toList();
}
void deleteThisItem(String mealId){
    print("Delete : $mealId");
    setState(() {
    thisCategoryMeals.removeWhere((item)=>item.id==mealId);   
    });
}
  @override
  Widget build(BuildContext context) {
    // setData();
    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: ListView.builder(
        itemCount: thisCategoryMeals.length,
        itemBuilder: (ctx,index){
          return MealItem(
            id: thisCategoryMeals[index].id,
            title: thisCategoryMeals[index].title, 
            imageUrl: thisCategoryMeals[index].imageUrl, 
            duration: thisCategoryMeals[index].duration, 
            complexity: thisCategoryMeals[index].complexity, 
            affordability: thisCategoryMeals[index].affordability,
            // delete: deleteThisItem,
            );
        },
        )
    );
  }
}