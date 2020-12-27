import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/page_not_found_screen.dart';
import './screens/student_detail_screen.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // default is "/"
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryStudentScreen.routeName: (ctx) => CategoryStudentScreen(),
        StudentDetailScreen.routeName: (ctx) => StudentDetailScreen(),
        PageNotFoundScreen.routeName: (ctx) => PageNotFoundScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => PageNotFoundScreen());
      },
    );
  }
}
