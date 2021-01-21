import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../models/student_model.dart';
import '../screens/student_detail_screen.dart';

class StudentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final student = Provider.of<StudentModel>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(StudentDetailScreen.routeName, arguments: student.id);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).accentColor,
      child: Container(
        height: 100,
        width: double.infinity,
        child: Card(
          shadowColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        student.imageUrl,
                      ),
                    ),
                    title: Text(student.firstName + ' ' + student.lastName),
                    subtitle: Text(
                        'Grade: ' + student.grade + '\n' + student.profession),
                    trailing: Consumer<StudentModel>(
                      builder: (ctx, student, _) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              student.toggleFavoriteStatus(authData.token);
                            },
                            icon: Icon(
                              student.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
