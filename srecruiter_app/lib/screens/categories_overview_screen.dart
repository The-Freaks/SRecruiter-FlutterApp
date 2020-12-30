import 'package:flutter/material.dart';

import '../widgets/category_list.dart';

class CategoriesOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CategoryList(),
      ],
    );
  }
}
