import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/admin/admin_student_item.dart';
import '../../providers/students_provider.dart';

class AdminCategoryStudentItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final studentData = Provider.of<StudentsProvider>(context);
    final categoryStudent = studentData.studentItems.where((stud) {
      return stud.categoriesId.contains(categoryId);
    }).toList();
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: categoryStudent[index],
          child: AdminStudentItem(),
        );
      },
      itemCount: categoryStudent.length,
    );
  }
}
