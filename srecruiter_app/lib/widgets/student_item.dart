import 'package:flutter/material.dart';
import '../screens/student_detail_screen.dart';

class StudentItem extends StatelessWidget {
  final int id;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String grade;
  final bool isFavorite;

  StudentItem({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.imageUrl,
    @required this.grade,
    @required this.isFavorite,
  });

  void selectStudent(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        StudentDetailScreen.routeName,
        arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectStudent(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).accentColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(imageUrl, fit: BoxFit.cover,),
            ),
            title: Text(firstName + ' ' + lastName),
            subtitle: Text('Grade: ' + grade),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              Icon(
                Icons.favorite,
                color: Theme.of(context).accentColor,
              ),
              Icon(
                Icons.restore_from_trash,
                color: Theme.of(context).primaryColor,
              ),
            ],)
          ),
        ],),
      ),
    );
  }
}
