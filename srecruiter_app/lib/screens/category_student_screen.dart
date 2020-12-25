import 'package:flutter/material.dart';
import 'package:srecruiter_app/models/student_model.dart';

import '../data/student_data.dart';

class CategoryStudentScreen extends StatelessWidget {
  static const routeName = "/category-student";
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryStudent = studentData.where((StudentModel){
      return StudentModel.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
        return Text(categoryStudent[index].profession);
      },itemCount: categoryStudent.length,
      )
    );
  }
}
