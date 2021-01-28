import 'package:flutter/material.dart';

import '../../widgets/admin/admin_category_student_item.dart';
import 'edit_student_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class AdminCategoryStudentsScreen extends StatelessWidget {
  static const routeName = "/admin-category-student";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            splashColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).pushNamed(EditStudentScreen.routeName);
            },
          )
        ],
      ),
      body: AdminCategoryStudentItem(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   splashColor: Theme.of(context).primaryColor,
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(EditStudentScreen.routeName);
      //   },
      // ),
    );
  }
}
