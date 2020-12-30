import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:srecruiter_app/models/student_model.dart';

import '../screens/student_detail_screen.dart';

class StudentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final student = Provider.of<StudentModel>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(StudentDetailScreen.routeName, arguments: student.id);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).accentColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    student.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(student.firstName + ' ' + student.lastName),
                subtitle: Text('Grade: ' + student.grade),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        student.toggelFavoriteStatus();
                      },
                      icon: Icon(
                        student.isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.restore_from_trash,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
