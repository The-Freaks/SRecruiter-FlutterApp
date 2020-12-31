import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/students_provider.dart';
import '../widgets/student_item.dart';

class CategoryStudentItem extends StatelessWidget {
  final bool showFavorites;

  CategoryStudentItem(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final studentData = Provider.of<StudentsProvider>(context);
    final categoryStudent = showFavorites ? studentData.favoriteStudent
    :studentData.studentItems.where((stud) {
      return stud.categoriesId.contains(categoryId);
    }).toList();
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: categoryStudent[index],
          child: StudentItem(),
        );
      },
      itemCount: categoryStudent.length,
    );
  }
}