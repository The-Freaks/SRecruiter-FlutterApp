import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoryModel> _categoryItems = [
    CategoryModel(
      id: 'se',
      title: 'Software Engineering',
      imageUrl: Icons.computer_rounded,
      color: Colors.deepPurpleAccent,
    ),
    CategoryModel(
      id: 'gd',
      title: 'Graphic Design',
      imageUrl: Icons.design_services_rounded,
      color: Colors.red[300],
    ),
    CategoryModel(
      id: 'bm',
      title: 'Business Management',
      imageUrl: Icons.business_center_rounded,
      color: Colors.cyan,
    ),
    CategoryModel(
      id: 'inf',
      title: 'Infirmary',
      imageUrl: Icons.local_hospital_rounded,
      color: Colors.green[300],
    ),
    CategoryModel(
      id: 'eng',
      title: 'English',
      imageUrl: Icons.language_outlined,
      color: Colors.orange[300],
    ),
    // CategoryModel(
    //     id: 'eng',
    //     title: 'English',
    //     imageUrl:  Icons.add,
    //     color: Colors.pink[300],
    // ),
    // CategoryModel(
    //     id: 'eng',
    //     title: 'English',
    //     imageUrl: Icons.add,
    //     color: Colors.pink,
    // ),
    // CategoryModel(
    //     id: 'eng',
    //     title: 'English',
    //     imageUrl:  Icons.add,
    //     color: Colors.blue,
    // ),
    // CategoryModel(
    //   id: 'eng',
    //   title: 'English',
    //   imageUrl:  Icons.add,
    //   color: Colors.green[900],
    // ),
    // CategoryModel(
    //   id: 'eng',
    //   title: 'English',
    //   imageUrl:  Icons.add,
    //   color: Colors.deepPurpleAccent,
    // ),
    // CategoryModel(
    //   id: 'eng',
    //   title: 'English',
    //   imageUrl:  Icons.add,
    //   color: Colors.redAccent,
    // ),
    // CategoryModel(
    //   id: 'eng',
    //   title: 'English',
    //   imageUrl:  Icons.add,
    //   color: Colors.yellowAccent,
    // ),
  ];

  List<CategoryModel> get categoryItems {
    return [..._categoryItems];
  }
}
