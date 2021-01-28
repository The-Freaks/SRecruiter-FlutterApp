import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/students_provider.dart';

class StudentDetailScreen extends StatelessWidget {
  static const routeName = "/student-detail";

  Future<void> _launchMaker(
      String launcherOption, String launcherData, BuildContext ctx) async {
    var url = "$launcherOption:$launcherData";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred'),
          content: Text('Something went wrong, please try again later.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _launchUrl(String url, BuildContext ctx) async {
    // _launchMaker(url, launchData, ctx);
    try {
      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (error) {
      return showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred'),
          content: Text('Something went wrong, please try again later.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _launchCaller(String number, BuildContext ctx) async {
    await _launchMaker('tel', number, ctx);
  }

  Future<void> _launchEmail(String emailId, BuildContext ctx) async {
    await _launchMaker('mailto', '$emailId', ctx);
  }

  @override
  Widget build(BuildContext context) {
    final studentId = ModalRoute.of(context).settings.arguments as String;
    final selectedStudent =
        Provider.of<StudentsProvider>(context, listen: false)
            .findStudentById(studentId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedStudent.firstName + ' ' + selectedStudent.lastName),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300.0,
                child: GridTile(
                  child: Container(
                    color: Theme.of(context).accentColor,
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      onPressed: () async {
                        _launchEmail(selectedStudent.email, context);
                      },
                      color: Theme.of(context).primaryColor,
                      height: 50,
                      elevation: 0.2,
                      child: Text(
                        'EMAIL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        _launchCaller(selectedStudent.phoneNumber, context);
                      },
                      splashColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).primaryColor,
                      height: 50,
                      elevation: 0.2,
                      child: Text(
                        'CALL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Biography",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        selectedStudent.biography,
                        style: new TextStyle(
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Social Media",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
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
                          'https://www.instagram.com/${selectedStudent.instagram}',
                          context,
                        );
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
                          context,
                        );
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
                          context,
                        );
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
                          context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
