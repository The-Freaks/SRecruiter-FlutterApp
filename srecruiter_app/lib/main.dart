import 'package:flutter/material.dart';

import './screens/category_student_screen.dart';
import './screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            fontSize: 13,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      initialRoute: '/', // default is "/"
      routes: {
        '/': (ctx) => DashboardScreen(),
        CategoryStudentScreen.routeName: (ctx) => CategoryStudentScreen(),
      },
    );
  }
}