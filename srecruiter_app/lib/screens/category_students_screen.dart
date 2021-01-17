import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srecruiter_app/providers/students_provider.dart';

import '../widgets/category_student_item.dart';

enum FilterOptions {
  Favorites,
  All,
}

class CategoryStudentsScreen extends StatefulWidget {
  static const routeName = "/category-student";

  @override
  _CategoryStudentsScreenState createState() => _CategoryStudentsScreenState();
}

class _CategoryStudentsScreenState extends State<CategoryStudentsScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: const Text('Favorites only'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: const Text('Show All'),
                      value: FilterOptions.All,
                    ),
                  ])
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<StudentsProvider>(context, listen: false).fetchAndSetStudents(),
        builder: (ctx, dataSnapshot){
          if(dataSnapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            if(dataSnapshot.error != null){
              return Center(
                child: AlertDialog(
                  title: Text('An error occurred'),
                  content: Text('Something went wrong!'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Okay'),
                    ),
                  ],
                ),
              );
            }else{
              return Consumer<StudentsProvider>(builder: (ctx, _, child) => CategoryStudentItem(_showOnlyFavorites),);
            }
          }
        },
      ),
    );
  }
}