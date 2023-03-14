import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../models/foods.dart';
import './food_item.dart';

class FoodsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final foodData = Provider.of<Foods>(context);
    final foods = foodData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: foods.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (_)=>foods[i],
        child: FoodItem(),

        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
        )


    );
  }
}