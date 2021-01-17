import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier {
  final String id;
  final String title;
  final IconData imageUrl;
  final Color color;

  CategoryModel(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.color});
}
