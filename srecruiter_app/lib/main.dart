import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srecruiter_app/providers/students_provider.dart';

import './providers/categories_provider.dart';
import './screens/login_screen.dart';
import './screens/tabs_screen.dart';
import './screens/page_not_found_screen.dart';
import './screens/student_detail_screen.dart';
import './screens/category_students_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
          value: CategoriesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: StudentsProvider(),
        ),
      ],
        child: MaterialApp(
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
            CategoryStudentsScreen.routeName: (ctx) => CategoryStudentsScreen(),
            StudentDetailScreen.routeName: (ctx) => StudentDetailScreen(),
            PageNotFoundScreen.routeName: (ctx) => PageNotFoundScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => PageNotFoundScreen());
          },
        ),
      );
  }
}
