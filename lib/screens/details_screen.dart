import 'package:flutter/material.dart';

import '../Dummy_data/dummy_data .dart';
import '../models/meals.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details-screen';
  List<Meal> favouriteMeals=[];
  Function upDateFavourite;
  Function toggleFavourite;
  DetailsScreen({
    required this.favouriteMeals,
    required this.upDateFavourite,
    required this.toggleFavourite,
  });
  @override

  Widget IngridentsList(List<String> list){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx,index){
        return Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(list[index],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          ),
        );
      },
    );
  }

  Widget ReturnList(List<String> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text("#${index + 1}",
                    style: TextStyle(color :Colors.white, fontSize: 18),
                    ),
                  ),
                  title: Text(
                    "${list[index]}",
                    style: TextStyle( fontSize: 18),
                  ),
                ),
                Divider(),
              ],
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final Meal mealData =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId) as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 1.4,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 14,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          mealData.imageUrl,
                          height: size.height * 0.35,
                          width: size.width,
                          fit: BoxFit.cover,
                        ),
                      ))),
              SizedBox(height: size.height * 0.015),
              Center(
                child: Text(
                  '- Ingridents -',
                  style: TextStyle(color: Colors.amber.shade500 , fontSize: 24, fontFamily: 'Roboto'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                padding: EdgeInsets.all(5),
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                    // color: Colors.grey[300],
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 240, 217, 9)),
                    borderRadius: BorderRadius.circular(4)),
                child: IngridentsList(mealData.ingredients),
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                  child: Text(
                '- Steps to follow -',
                style: TextStyle(fontSize: 24, fontFamily: 'Roboto'),
              )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                padding: EdgeInsets.all(5),
                height: size.height * 0.43,
                width: size.width,
                decoration: BoxDecoration(
                    // color: Colors.grey[300],
                    border: Border.all(width: 3, color: Colors.grey[500]!),
                    borderRadius: BorderRadius.circular(4)),
                child: ReturnList(mealData.steps),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // Navigator.of(context).pop(mealId);
        upDateFavourite(mealId);
      },child: Icon(
        toggleFavourite(mealId) ?
        Icons.star : 
        Icons.star_border
      ),),
    );
  }
}
