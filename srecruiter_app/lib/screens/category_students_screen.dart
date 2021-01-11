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
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoading = true;
      });
      Provider.of<StudentsProvider>(context).fetchAndSetStudents().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
                      child: Text('Favorites only'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    ),
                  ])
        ],
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) : CategoryStudentItem(_showOnlyFavorites),
    );
  }
}
