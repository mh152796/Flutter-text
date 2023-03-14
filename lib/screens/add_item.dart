import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/foods.dart';
class AddItem extends StatefulWidget {
  static const routeName = '/addItem';
  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _keyForm = GlobalKey<FormState>();
  String xyz='';
  late Foods foodList;
  final itemNameController = TextEditingController();
  final itemDescriptionController = TextEditingController();
  final itemPriceController = TextEditingController();
  final itemURLController = TextEditingController();
  void  saveItemToList(){
    print("Saved ${itemNameController.text}");
    if(_keyForm.currentState!.validate()){
      Food food =  Food(
        title: itemNameController.text,
        description: itemDescriptionController.text,
        price: double.parse(itemPriceController.text),
        imageUrl: itemURLController.text,
        id: '',
      );

      foodList.addFood(food);

      itemNameController.text = '';
      itemDescriptionController.text = '';
      itemPriceController.text = '';
      itemURLController.text = '';

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Saved Item')));

    }




  }
  @override
  Widget build(BuildContext context) {
    foodList = Provider.of<Foods>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Form(
          key: _keyForm,
          child: ListView(
            children: [
              TextFormField(
                // onChanged: (v){
                //   xyz = v;
                // },
                controller: itemNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please enter item name';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Item Name',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: itemDescriptionController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please enter item Description';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Item Description',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: itemPriceController,
                textInputAction: TextInputAction.next,
                maxLength: 11,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please enter item price';
                  }
                  else{
                    // if(value.length == 11)
                    //   {
                    //     return null;
                    //   }
                    // else{
                    //   return 'please enter 11 digit mobile number';
                    // }
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Item Price',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: itemURLController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please enter item URL';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Item URL',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){
                    saveItemToList();
                  },
                  child: Text('Save')
              )
            ],
          ),
        ),
      ),
    );
  }
}
