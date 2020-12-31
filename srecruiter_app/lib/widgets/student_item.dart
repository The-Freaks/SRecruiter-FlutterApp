import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/student_model.dart';
import '../screens/student_detail_screen.dart';

class StudentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final student = Provider.of<StudentModel>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(StudentDetailScreen.routeName, arguments: student.id);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).accentColor,
      child: Dismissible(
        key: ValueKey(student.id),
        background: Container(
          color: Theme.of(context).primaryColor,
          child: Icon(
            Icons.restore_from_trash_outlined,
            color: Colors.white,
            size: 30,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.all(10),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Are you certain that you want to delete this student?'),
              actions: [
                FlatButton(
                  onPressed: (){
                    Navigator.of(ctx).pop(false);
                  },
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.of(ctx).pop(true);
                  },
                  child: Text('Yes'),),
              ],
            ),
          );
        },
        onDismissed: (direction) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Item deleted',
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
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
                  subtitle: Text(
                      'Grade: ' + student.grade + '\n' + student.profession),
                  isThreeLine: true,
                  trailing: Consumer<StudentModel>(
                    builder: (ctx, student, _) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            student.toggelFavoriteStatus();
                          },
                          icon: Icon(
                            student.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
