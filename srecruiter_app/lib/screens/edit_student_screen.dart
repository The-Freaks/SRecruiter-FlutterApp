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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
              textInputAction: TextInputAction.next,
            ),
          ],
        )),
      ),
    );
  }
}
