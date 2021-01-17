import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories_provider.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final categoriesData = Provider.of<CategoriesProvider>(context);
    final categories = categoriesData.categoryItems;
    return Container(
      height: deviceSize.height,
      padding: EdgeInsets.only(top: 10),
      child: GridView(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        children: categories
            .map((catData) => Center(
                  child: ChangeNotifierProvider.value(
                    value: catData,
                    child: CategoryItem(),
                  ),
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
