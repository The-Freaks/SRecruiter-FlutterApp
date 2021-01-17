import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../../providers/categories_provider.dart';
import './admin_category_item.dart';

class AdminCategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final categoriesData = Provider.of<CategoriesProvider>(context);
    final categories = categoriesData.categoryItems;
    return Container(
      height: deviceSize.height,
      child: GridView.builder(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (ctx, i) => Center(
          child: ChangeNotifierProvider.value(
              value: categories[i],
            child: AdminCategoryItem(),
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      ),
    );
  }
}
