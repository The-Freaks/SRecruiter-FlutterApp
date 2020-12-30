import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srecruiter_app/providers/students_provider.dart';

import '../widgets/student_item.dart';

class CategoryStudentsScreen extends StatelessWidget {
  static const routeName = "/category-student";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryStudent = Provider.of<StudentsProvider>(context).studentItems.where((stud) {
      return stud.categoriesId.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider.value(
              value: categoryStudent[index],
              child: StudentItem(),
            );
          },
          itemCount: categoryStudent.length,
        ));
  }
}
