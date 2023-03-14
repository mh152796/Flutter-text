import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/food.dart';
import '../screens/food_detail_screen.dart';

class FoodItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final food = Provider.of<Food>(context);
   final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Food>(
      builder: (BuildContext context, food, child) =>ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                  FoodDetailScreen.routeName,
                  arguments: food.id
              );
            },
            child: Image.asset(
              food.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            title: Text(
              food.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                cart.addItem(food.id, food.price, food.title);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                  content: Text("Added item to cart", textAlign: TextAlign.center,),
                  duration: Duration(seconds: 4),
                      action: SnackBarAction(label: 'Undo', onPressed: ()=>cart.removeItem(food.id),),
                )
                );

              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}