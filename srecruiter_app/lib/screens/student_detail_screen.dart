import 'package:flutter/material.dart';
import 'package:srecruiter_app/models/student_model.dart';

import '../data/student_data.dart';

class StudentDetailScreen extends StatelessWidget {
  static const routeName = "/student-detail";
  @override
  Widget build(BuildContext context) {
    final studentId = ModalRoute.of(context).settings.arguments as int;
    final selectedStudent = studentData.firstWhere((StudentModel) => StudentModel.id == studentId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedStudent.firstName + ' ' + selectedStudent.lastName),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            new Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Colors.redAccent,
                  child: Image.network(selectedStudent.imageUrl, width: double.infinity, fit: BoxFit.cover,),
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(selectedStudent.firstName + ' ' + selectedStudent.lastName, style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
                    title: new Row(
                      children: <Widget> [
                        Expanded(child: new Text(selectedStudent.profession)),
                        Expanded(child: new Text('Grade: ' + selectedStudent.grade)),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                        onPressed: (){},
                        height: 50.0,
                        color: Colors.redAccent,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("EMAIL NOW")
                    )
                ),
                Expanded(
                    child: MaterialButton(
                        onPressed: (){},
                        height: 50.0,
                        color: Colors.redAccent,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("CALL NOW")
                    )
                ),
              ],
            ),

            Divider(),

            new ListTile(
              title: new Text("Biography", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),

              subtitle:  Padding(padding: const EdgeInsets.fromLTRB(2.0, 10.0, 5.0, 5.0),
                child: new Text(selectedStudent.biography, style: new TextStyle(fontSize: 14.0,), textAlign: TextAlign.left ,),),
            ),

            Divider(),

            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text("Instagram:", style: new TextStyle(fontWeight: FontWeight.bold),),),
                Padding(padding: EdgeInsets.all(5.0),
                  child: new Text(selectedStudent.instagram),
                )
              ],
            ),

            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 17.0, 0.0),
                  child: new Text("LinkedIn:", style: new TextStyle(fontWeight: FontWeight.bold),),),
                Padding(padding: EdgeInsets.all(5.0),
                  child: new Text(selectedStudent.facebook),
                )
              ],
            ),

            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 28.0, 5.0),
                  child: new Text("Twitter:", style: new TextStyle(fontWeight: FontWeight.bold),),),
                Padding(padding: EdgeInsets.all(5.0),
                  child: new Text(selectedStudent.linkedIn),
                )
              ],
            ),

            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 10.0, 5.0),
                  child: new Text("Facebook:", style: new TextStyle(fontWeight: FontWeight.bold),),),
                Padding(padding: EdgeInsets.all(5.0),
                  child: new Text(selectedStudent.twitter),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
