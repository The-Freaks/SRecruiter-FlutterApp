import 'package:flutter/material.dart';

class EditStudentScreen extends StatefulWidget {
  @override
  _EditStudentScreenState createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit student'),
      ),
      body: Center(
        child: Text(
          'This is the Edit Screen.'
        ),
      ),
    );
  }
}
