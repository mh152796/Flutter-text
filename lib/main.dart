import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/foods_overview_screen.dart';
import './screens/food_detail_screen.dart';
import 'models/cart.dart';
import 'models/foods.dart';
import 'screens/add_item.dart';
import 'widgets/edit_item.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>Foods()),
        ChangeNotifierProvider(create:(_)=> Cart())
      ],
      child: MaterialApp(
          title: 'Food Order',
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.orange,
            fontFamily: 'Lato',
          ),
          home: FoodsOverviewScreen(),
          routes: {
            FoodDetailScreen.routeName: (ctx) => FoodDetailScreen(),
            AddItem.routeName: (ctx) => AddItem(),
            EditItem.routeName: (ctx) => EditItem(),

          }
      ),
    );

  }
}