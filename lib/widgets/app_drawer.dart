import 'package:flutter/material.dart';

import '../screens/food_list.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('xyz'),
            accountEmail: Text('xyz@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('X'),
            ),
            decoration: BoxDecoration(color: Colors.purple),
            otherAccountsPictures: [
              CircleAvatar(
                child: Text('X'),
              ),
              CircleAvatar(
                child: Text('X'),
              )
            ],
          ),
          ListTile(
            title: Text('Page1'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Page1');
            },
          ),
          ListTile(
            title: Text('Page2'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Orders');
            },
          ),
          ListTile(
            title: Text('Manage Foods'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute( builder: (ctx)
                  {
                    return FoodListScreen();
                  }
                  )
              );
            },
          )
        ],
      ),
    );
  }
}
