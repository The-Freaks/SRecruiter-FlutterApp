import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../widgets/category_grid.dart';

class CategoriesOverviewScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            // alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CategoryGrid(),
        ],
      ),
    );
  }
}
