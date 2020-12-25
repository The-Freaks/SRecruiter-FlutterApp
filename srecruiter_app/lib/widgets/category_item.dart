import 'package:flutter/material.dart';

import '../screens/category_student_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(this.id, this.title, this.imageUrl);

  void selectedCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryStudentScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      borderRadius: BorderRadius.circular(50),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: ListTile(
          title: Image.network(imageUrl),
          subtitle: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
