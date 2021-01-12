import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoryModel> _categoryItems = [
    CategoryModel(
        id: 'se',
        title: 'Software Engineering',
        imageUrl:
            'https://www.verdadesign.com/assets/thumbnails/image/winnipeg-graphic-design.png',
    ),
    CategoryModel(
        id: 'gd',
        title: 'Graphic Design',
        imageUrl:
            'https://www.verdadesign.com/assets/thumbnails/image/winnipeg-graphic-design.png',
    ),
    CategoryModel(
        id: 'bm',
        title: 'Business Management',
        imageUrl:
            'https://www.verdadesign.com/assets/thumbnails/image/winnipeg-graphic-design.png',
    ),
    CategoryModel(
        id: 'inf',
        title: 'Infirmary',
        imageUrl:
            'https://www.verdadesign.com/assets/thumbnails/image/winnipeg-graphic-design.png',
    ),
    CategoryModel(
        id: 'eng',
        title: 'English',
        imageUrl:
            'https://www.verdadesign.com/assets/thumbnails/image/winnipeg-graphic-design.png',
    ),
  ];

  List<CategoryModel> get categoryItems {
    return [..._categoryItems];
  }
}
