// import 'package:flutter/material.dart';
// import './categories_screen.dart';

// import 'favourites_screen.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key? key}) : super(key: key);

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("MealApp"),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 child: Row(
//                   children: [
//                     Icon(Icons.line_weight_sharp),
//                     Text("Categories"),
//                   ],
//                 ),
//               ),
//               Tab(
//                 child: Row(
//                   children: [
//                     Icon(Icons.star_border_purple500_rounded),
//                     Text("Favourites"),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(children: [CategoriesScreen(), FavouritesScreen()]),
//       ),
//     );
//   }
// }
