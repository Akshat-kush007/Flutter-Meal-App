import 'package:flutter/material.dart';
import 'package:meal_app/Dummy_data/dummy_data%20.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: DUMMY_CATEGORIES.map((itemData) {
            return CategoryItem(
              id: itemData.id,
              data: itemData.title,
              color: itemData.color,
            );
          }).toList()
          // floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
    );
  }
}
