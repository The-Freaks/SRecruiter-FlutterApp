import 'package:flutter/material.dart';
import 'package:srecruiter_app/providers/students_provider.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../screens/page_not_found_screen.dart';

class StudentDetailScreen extends StatelessWidget {
  static const routeName = "/student-detail";

  void _launchUrl(String url, BuildContext ctx) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Navigator.of(ctx).pushNamed(PageNotFoundScreen.routeName);
    }
  }

  void _launchCaller(String number, BuildContext ctx) async {
    var url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Navigator.of(ctx).pushNamed(PageNotFoundScreen.routeName);
    }
  }

  void _launchEmail(String emailId, BuildContext ctx) async {
    var url = "mailto:$emailId?subject= Hola Señor/Señora";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Navigator.of(ctx).pushNamed(PageNotFoundScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final studentId = ModalRoute.of(context).settings.arguments as int;
    final selectedStudent =
        Provider.of<StudentsProvider>(context, listen: false)
            .findStudentById(studentId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedStudent.firstName + ' ' + selectedStudent.lastName),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       selectedStudent.toggelFavoriteStatus();
        //       print(selectedStudent.isFavorite);
        //     },
        //     icon: Icon(
        //       selectedStudent.isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
        //     ),
        //   ),
        // ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 300.0,
                  child: GridTile(
                    child: Container(
                      color: Colors.redAccent,
                      child: Image.network(
                        selectedStudent.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    footer: Container(
                      height: 50,
                      color: Colors.white70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            selectedStudent.profession,
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Grade: ' + selectedStudent.grade,
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      onPressed: () async {
                        _launchEmail(selectedStudent.email, context);
                      },
                      splashColor: Theme.of(context).primaryColor,
                      splashRadius: 30,
                      icon: Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _launchCaller(selectedStudent.phoneNumber, context);
                      },
                      splashColor: Theme.of(context).primaryColor,
                      splashRadius: 30,
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Divider(),
                ListTile(
                  title: new Text(
                    "Biography",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 10.0, 5.0, 5.0),
                    child: new Text(
                      selectedStudent.biography,
                      style: new TextStyle(
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          _launchUrl(
                              "https://www.instagram.com/${selectedStudent.instagram}",
                              context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _launchUrl(
                              "https://www.facebook.com/${selectedStudent.facebook}",
                              context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          _launchUrl(
                              "https://www.linkedin.com/${selectedStudent.linkedIn}",
                              context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _launchUrl(
                              "https://www.twitter.com/${selectedStudent.twitter}",
                              context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
