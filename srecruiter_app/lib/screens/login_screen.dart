import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final _passwordFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset('assets/images/SR-logo.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-Mail',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: 'Type your email address',
                            hintStyle: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          focusNode: _passwordFocusNode,
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value))
                              return 'Enter a Valid Email';
                            else
                              return null;
                          },
                          onSaved: (value) {
                            //_authData['email'] = value;
                          },
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: 'Type your password',
                            hintStyle: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          //controller: _passwordController,
                          validator: (value) {
                            if (value.isEmpty || value.length < 5) {
                              return 'Password is too short!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //_authData['password'] = value;
                          },
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
