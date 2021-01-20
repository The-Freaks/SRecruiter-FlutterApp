import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './providers/students_provider.dart';
import './providers/categories_provider.dart';
import './providers/auth.dart';
import './screens/admin/register_screen.dart';
import './screens/admin/admin_categories_screen.dart';
import './screens/admin/edit_student_screen.dart';
import './screens/categories_overview_screen.dart';
import './screens/login_screen.dart';
import './screens/page_not_found_screen.dart';
import './screens/student_detail_screen.dart';
import './screens/category_students_screen.dart';
import './screens/admin/admin_category_students_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => StudentsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xff006699),
          accentColor: Color(0xff6699CC),
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
        // home: LoginScreen(),
        // default is "/"
        routes: {
          '/': (ctx) => CategoriesOverviewScreen(),
          CategoryStudentsScreen.routeName: (ctx) => CategoryStudentsScreen(),
          StudentDetailScreen.routeName: (ctx) => StudentDetailScreen(),
          PageNotFoundScreen.routeName: (ctx) => PageNotFoundScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          EditStudentScreen.routeName: (ctx) => EditStudentScreen(),
          AdminCategoriesScreen.routeName: (ctx) => AdminCategoriesScreen(),
          AdminCategoryStudentsScreen.routeName: (ctx) => AdminCategoryStudentsScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => PageNotFoundScreen());
        },
      ),
    );
  }
}
