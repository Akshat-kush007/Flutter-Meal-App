import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/category_item.dart';

import '../screens/details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function delete;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    // required this.delete,
  });

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";

      case Complexity.Hard:
        return "Hard";

      case Complexity.Challenging:
        return "Chllanging";

      default:
        return "Unknown";
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.Pricey:
        return "Pricey";

      case Affordability.Luxurious:
        return "Luxurious";

      default:
        return "Unknown";
    }
  }

  void onItemSelected(BuildContext context) {
    Navigator.of(context).pushNamed(
      DetailsScreen.routeName,
      arguments: id,
    ).then((value) {
      if(value!=null){
        // delete(value);
      }
        print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      // splashColor: Colors.black26,
      onTap: () => onItemSelected(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: width - 10,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.transparent])),
                    width: width - 10,
                    height: 100,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              width: width - 10,
              padding:  const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Column(
                children: [
                  Divider(
                      height: 2,
                      color: Colors.grey[900],
                      indent: 6,
                      endIndent: 6),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "$duration",
                            style:const TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.work,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "$getComplexity",
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "$getAffordability",
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
