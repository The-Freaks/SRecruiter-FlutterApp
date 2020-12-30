import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}
