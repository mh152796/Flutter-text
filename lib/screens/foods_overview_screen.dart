import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import 'package:providerstatemanagement/widgets/badge.dart';
import '../models/cart.dart';
import '../widgets/foods_grid.dart';

class FoodsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Order'),
        actions: [

          Consumer<Cart>(
            builder: (context,cart,chid)=>Badges(
              child:  IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () {},
              ),
              value: cart.itemCount.toString(),
              color: Colors.black,
            ),
          )
        ],
      ),

      drawer: AppDrawer(),
      body: FoodsGrid(),
    );
  }
}