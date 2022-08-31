import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
Widget buildListItem(String title, IconData icondata,VoidCallback action){
  return ListTile(
    leading: Icon(icondata),
    title: Text(title,
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: 24,
        ),
    ),
    onTap:action,
  );
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          alignment: Alignment.topLeft,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    primary: Colors.black
                  ), 
                  icon: const Icon(Icons.arrow_back_ios), 
                  label: const Text("Close"),),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: const Text("Meal App",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                )),
          ),
              
          ],) ,
        ),
        buildListItem("Meal",Icons.restaurant,
        (){
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListItem("Filters",Icons.settings,
        (){
          Navigator.of(context).pushNamed(FiltersScreen.routName);
        })
      ]),
    );
  }
}
