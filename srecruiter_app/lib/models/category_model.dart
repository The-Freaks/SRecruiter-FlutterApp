import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;

  CategoryModel(
      {@required this.id, @required this.title, @required this.imageUrl});
}
