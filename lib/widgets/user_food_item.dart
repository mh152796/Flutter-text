import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/foods.dart';
import 'edit_item.dart';

class UserFoodItem extends StatelessWidget {


  late final Food food;

  UserFoodItem(this.food);

  void removeAFood(BuildContext context){
    var foodList = Provider.of<Foods>(context, listen: false);
    foodList.removeAFoodItem(food.id);
  }

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(food.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(food.imageUrl),
       ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
             Navigator.of(context).pushNamed(EditItem.routeName,arguments: food);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
             removeAFood(context);
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}