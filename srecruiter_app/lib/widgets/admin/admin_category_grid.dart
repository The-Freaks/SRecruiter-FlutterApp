import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/categories_provider.dart';
import './admin_category_item.dart';

class AdminCategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoriesProvider>(context);
    final categories = categoriesData.categoryItems;
    return Container(
      height: 550,
      padding: EdgeInsets.all(10),
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
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
