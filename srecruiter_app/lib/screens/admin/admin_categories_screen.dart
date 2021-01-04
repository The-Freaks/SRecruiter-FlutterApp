import 'package:flutter/material.dart';
import 'package:srecruiter_app/widgets/admin/admin_category_grid.dart';
import 'package:srecruiter_app/widgets/main_drawer.dart';

class AdminCategoriesScreen extends StatelessWidget {
  static const routeName = '/admin-categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Students'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: const Text(
              'Categories',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AdminCategoryGrid(),
        ],
      ),
    );
  }
}
