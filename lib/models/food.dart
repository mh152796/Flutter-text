import 'package:flutter/foundation.dart';

class Food extends ChangeNotifier{
  final String id;
  late final String title;
  late final String description;
  late final double price;
  late final String imageUrl;
  bool isFavorite;

  Food({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}