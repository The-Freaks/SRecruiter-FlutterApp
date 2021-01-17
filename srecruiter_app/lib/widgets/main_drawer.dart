import 'package:flutter/material.dart';

import '../screens/admin/edit_student_screen.dart';
import '../screens/admin/admin_categories_screen.dart';
import '../screens/login_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, bool isSelected, Function tapHandler, BuildContext ctx) {
    return ListTile(
      tileColor: Color(0xffF2F7FB),
      selectedTileColor: Theme.of(ctx).accentColor,
      selected: isSelected,
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(ctx).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(ctx).primaryColor,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _isSelected = false;
    return Drawer(
      child: Container(
        // color: Color(0xffF2F7FB),
        child: Column(
          children: [
            Container(
              height: 135,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.white,
              child: Image.asset(
                'assets/images/SR-banner.png',
              ),
            ),
            buildListTile(
              'Dashboard',
              Icons.dashboard_rounded,

              _isSelected,
              () {
                Navigator.of(context).pushReplacementNamed('/');
                _isSelected = true;
                print(_isSelected);
              },
              context,
            ),

            buildListTile(
              'Manage Students',
              Icons.edit_off,
              _isSelected,
              () {
                _isSelected = true;
                Navigator.of(context)
                    .pushReplacementNamed(AdminCategoriesScreen.routeName);
              },
              context,
            ),
            buildListTile(
              'Add Student',
              Icons.person_add,
              _isSelected,
                  () {
                    _isSelected = true;
                Navigator.of(context).pushReplacementNamed(EditStudentScreen.routeName);
              },
              context,
            ),
            buildListTile(
              'Login',
              Icons.login_rounded,
              _isSelected,
              () {
                _isSelected = true;
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },
              context,
            ),
          ],
        ),
      ),
    );
  }
}
