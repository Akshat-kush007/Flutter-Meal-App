import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String data;
  final Color color;
  
  CategoryItem({
    required this.id,
    required this.data,
    required this.color
  });

  // void _onSelect(BuildContext ctx){
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(builder: (_){
  //       return MealsScreen(
  //         id: id,
  //         title: data,
  //       );
  //   }));
  // }
  void _onSelect(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealsScreen.routName,arguments: {'title':data,'id':id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _onSelect(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [color.withOpacity(0.7),color],
                begin:Alignment.topLeft,
                end: Alignment.bottomRight,
                )
               ),
            child:Text(data,style: TextStyle(fontWeight: FontWeight.bold),),     
      ),
    );
  }
}