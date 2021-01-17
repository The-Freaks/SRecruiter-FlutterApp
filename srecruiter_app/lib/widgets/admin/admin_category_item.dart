import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category_model.dart';
import '../../screens/admin/admin_category_students_screen.dart';

class AdminCategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryModel>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AdminCategoryStudentsScreen.routeName, arguments: {
          'id': category.id,
          'title': category.title,
        });
      },
      splashColor: Theme.of(context).primaryColor,
      // borderRadius: BorderRadius.circular(15),
      child: ListTile(
        title: Image.network(category.imageUrl),
        subtitle: Container(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}