import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404 error'),
      ),
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
