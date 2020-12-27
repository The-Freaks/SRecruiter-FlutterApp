import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.white,
            child: Image.asset(
              'assets/images/SR-logo.png',
            ),
          ),
          SizedBox(height: 20,),
          buildListTile('Dashboard', Icons.dashboard_rounded),
          SizedBox(height: 5,),
          Divider(),
          buildListTile('Login', Icons.login_rounded),
        ],
      ),
    );
  }
}
