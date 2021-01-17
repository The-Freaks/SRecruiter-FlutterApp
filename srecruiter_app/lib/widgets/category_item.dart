import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:srecruiter_app/models/category_model.dart';

import '../screens/category_students_screen.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryModel>(context);
    return Container(
      color: category.color,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(CategoryStudentsScreen.routeName, arguments: {
            'id': category.id,
            'title': category.title,
          });
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Icon(
              category.imageUrl,
              size: 60,
              color: Colors.white,
            ),
          ),
          footer: Container(
            height: 30,
            color: Colors.white54,
            child: Center(
              child: Text(
                category.title,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
