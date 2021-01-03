import 'package:flutter/material.dart';

class EditStudentScreen extends StatefulWidget {
  static const routeName = '/edit-student';
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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10,),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'First Name'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10,),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Last Name'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Profession'),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Grade'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Number'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Biography'),
                textInputAction: TextInputAction.next,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Instagram'),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Facebook'),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'LinkedIn'),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Twitter'),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            // Column(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextFormField(
            //         decoration: InputDecoration(labelText: 'ImageUrl'),
            //         textInputAction: TextInputAction.next,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        )),
      ),
    );
  }
}
