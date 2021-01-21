import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/http_exception.dart';
import '../../providers/auth.dart';
import '../../widgets/main_drawer.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-user';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _passwordController = TextEditingController();

  var _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  Map<String, String> _registerData = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'password': '',
    'confirmPassword': '',
  };

  void _showErrorDialogBox(String message) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An error occurred'),
        content: Text(message),
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

  @override
  void dispose() {
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false).signUp(
        _registerData['email'],
        _registerData['password'],
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed.';
      if (error.message.contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.message.contains('INVAILD_EMAIL')) {
        errorMessage = 'This email address is not valid.';
      } else if (error.message.contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.message.contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is to weak.';
      } else if (error.message.contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password';
      }
      _showErrorDialogBox(errorMessage);
    } catch (error) {
      const errorMessage = 'Authentication failed, please try again later.';
      _showErrorDialogBox(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register new user'),
      ),
      drawer: MainDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text('Add new user'),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'First name',
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: Theme.of(context).primaryColor),
                      //     ),
                      //     hintText: 'Type user\'s name.',
                      //     hintStyle: TextStyle(
                      //       fontSize: 12,
                      //     ),
                      //   ),
                      //   textInputAction: TextInputAction.next,
                      //   keyboardType: TextInputType.name,
                      //   onFieldSubmitted: (_) {
                      //     FocusScope.of(context)
                      //         .requestFocus(_lastNameFocusNode);
                      //   },
                      //   onSaved: (value) {
                      //     _registerData['firstName'] = value;
                      //   },
                      //   validator: (value) {
                      //     String pattern = r'(^[a-zA-Z]*$)';
                      //     RegExp regExp = new RegExp(pattern);
                      //     if (value.length == 0) {
                      //       return 'Please enter a first name';
                      //     } else if (!regExp.hasMatch(value)) {
                      //       return 'Please enter a valid first name';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Last name',
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: Theme.of(context).primaryColor),
                      //     ),
                      //     hintText: 'Type user\'s surname.',
                      //     hintStyle: TextStyle(
                      //       fontSize: 12,
                      //     ),
                      //   ),
                      //   textInputAction: TextInputAction.next,
                      //   keyboardType: TextInputType.name,
                      //   onFieldSubmitted: (_) {
                      //     FocusScope.of(context)
                      //         .requestFocus(_emailFocusNode);
                      //   },
                      //   focusNode: _lastNameFocusNode,
                      //   onSaved: (value) {
                      //     _registerData['lastName'] = value;
                      //   },
                      //   validator: (value) {
                      //     String pattern = r'(^[a-zA-Z]*$)';
                      //     RegExp regExp = new RegExp(pattern);
                      //     if (value.length == 0) {
                      //       return 'Please enter a last name';
                      //     } else if (!regExp.hasMatch(value)) {
                      //       return 'Please enter a valid last name';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'E-Mail',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          hintText: 'Type users\'s email address.',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        focusNode: _emailFocusNode,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value))
                            return 'Enter a Valid Email.';
                          else
                            return null;
                        },
                        onSaved: (value) {
                          _registerData['email'] = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          hintText: 'Type user\'s password.',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_confirmPasswordFocusNode);
                        },
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        obscureText: true,
                        //controller: _passwordController,
                        validator: (value) {
                          if (value.isEmpty || value.length <= 5) {
                            return 'Password is too short!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _registerData['password'] = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          hintText: 'Enter password again.',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        focusNode: _confirmPasswordFocusNode,
                        onSaved: (value) {
                          _registerData['confirmPassword'] = value;
                        },
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      if (_isLoading)
                        CircularProgressIndicator()
                      else
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: _submit,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'REGISTER',
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
    );
  }
}
