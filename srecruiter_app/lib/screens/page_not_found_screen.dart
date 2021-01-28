import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  static const routeName = "/page-not-found";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404 error'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          'assets/images/404.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
