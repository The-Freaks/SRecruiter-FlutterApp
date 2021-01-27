import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/admin/register_screen.dart';
import '../screens/admin/edit_student_screen.dart';
import '../screens/admin/admin_categories_screen.dart';
import '../screens/login_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, Function tapHandler, BuildContext ctx) {
    return ListTile(
      tileColor: Color(0xffF2F7FB),
      selectedTileColor: Theme.of(ctx).accentColor,
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
    final authData = Provider.of<Auth>(context, listen: false);
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
              () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              context,
            ),
            if (authData.isUserAdmin)
              buildListTile(
                'Manage Students',
                Icons.edit_off,
                () {
                  Navigator.of(context)
                      .pushReplacementNamed(AdminCategoriesScreen.routeName);
                },
                context,
              ),
            if (authData.isUserAdmin)
              buildListTile(
                'Add Student',
                Icons.person_add,
                () {
                  Navigator.of(context)
                      .pushReplacementNamed(EditStudentScreen.routeName);
                },
                context,
              ),
            if (authData.isUserAdmin)
              buildListTile(
                'Add User',
                Icons.supervised_user_circle_sharp,
                () {
                  Navigator.of(context)
                      .pushReplacementNamed(RegisterScreen.routeName);
                },
                context,
              ),
            // if (authData.isAuth)
            buildListTile(
              'Logout',
              Icons.exit_to_app,
              () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                authData.logout();
              },
              context,
            ),
          ],
        ),
      ),
    );
  }
}
