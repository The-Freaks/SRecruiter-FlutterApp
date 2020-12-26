import 'package:flutter/material.dart';

import '../data/student_data.dart';
import 'category_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SRecruiter'),
      ),
      body: Column(
        children: <Widget>[
          Text('Categories'),
          CategoryScreen(),
        ],
      ),
    );
  }
}
