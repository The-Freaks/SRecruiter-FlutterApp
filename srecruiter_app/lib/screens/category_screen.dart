import 'package:flutter/material.dart';

import '../data/category_data.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(top: 10),
      child: GridView(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        children: CategoryData.map((catData) => Center(
              child: CategoryItem(
                catData.id,
                catData.title,
                catData.imageUrl,
              ),
            )).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130,
          // // childAspectRatio: 0.5,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
