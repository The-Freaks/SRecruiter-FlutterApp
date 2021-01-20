import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/main_drawer.dart';
import '../../models/student_model.dart';
import '../../providers/students_provider.dart';

class EditStudentScreen extends StatefulWidget {
  static const routeName = '/edit-student';

  @override
  _EditStudentScreenState createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final _lastNameFocusNode = FocusNode();
  final _professionFocusNode = FocusNode();
  final _gradeFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _numberFocusNode = FocusNode();
  final _categoryIdFocusNode = FocusNode();
  final _biographyFocusNode = FocusNode();
  final _instagramFocusNode = FocusNode();
  final _facebookFocusNode = FocusNode();
  final _linkedInFocusNode = FocusNode();
  final _twitterFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _editedStudent = StudentModel(
    id: null,
    categoriesId: '',
    imageUrl: '',
    firstName: '',
    lastName: '',
    profession: '',
    grade: '',
    email: '',
    phoneNumber: '',
    biography: '',
    instagram: '',
    facebook: '',
    linkedIn: '',
    twitter: '',
  );
  var _initialValues = {
    'id': '',
    'categoriesId': '',
    'imageUrl': '',
    'firstName': '',
    'lastName': '',
    'profession': '',
    'grade': '',
    'email': '',
    'phoneNumber': '',
    'biography': '',
    'instagram': '',
    'facebook': '',
    'linkedIn': '',
    'twitter': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final studentId = ModalRoute.of(context).settings.arguments as String;
      if (studentId != null) {
        _editedStudent =
            Provider.of<StudentsProvider>(context).findStudentById(studentId);
        _initialValues = {
          'id': _editedStudent.id,
          'categoriesId': _editedStudent.categoriesId,
          // 'imageUrl': _editedStudent.imageUrl,
          'firstName': _editedStudent.firstName,
          'lastName': _editedStudent.lastName,
          'profession': _editedStudent.profession,
          'grade': _editedStudent.grade,
          'email': _editedStudent.email,
          'phoneNumber': _editedStudent.phoneNumber,
          'biography': _editedStudent.biography,
          'instagram': _editedStudent.instagram,
          'facebook': _editedStudent.facebook,
          'linkedIn': _editedStudent.linkedIn,
          'twitter': _editedStudent.twitter,
        };
        _imageUrlController.text = _editedStudent.imageUrl;
      }
    }
    super.didChangeDependencies();
    _isInit = false;
  }

  @override
  void dispose() {
    _lastNameFocusNode.dispose();
    _professionFocusNode.dispose();
    _gradeFocusNode.dispose();
    _emailFocusNode.dispose();
    _numberFocusNode.dispose();
    _biographyFocusNode.dispose();
    _instagramFocusNode.dispose();
    _facebookFocusNode.dispose();
    _linkedInFocusNode.dispose();
    _twitterFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlController.dispose();
    super.dispose();
  }

  String _socialMedia(String value) {
    String pattern = r'(^[a-zA-Z0-9.]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter a username';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid username';
    }
    return null;
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final _isValid = _formKey.currentState.validate();
    if (!_isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      if (_editedStudent.id != null) {
        await Provider.of<StudentsProvider>(context, listen: false)
            .updateStudent(_editedStudent.id, _editedStudent);
      } else {
        await Provider.of<StudentsProvider>(context, listen: false)
            .addStudent(_editedStudent);
      }
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred'),
          content: Text('Something went wrong!'),
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
    } finally {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit student'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: _saveForm)],
      ),
      drawer: MainDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: Text(
                            'Add new Student',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        initialValue: _initialValues['firstName'],
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s first name',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_lastNameFocusNode);
                        },
                        validator: (value) {
                          String pattern = r'(^[a-zA-Z]*$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value.length == 0) {
                            return 'Please enter a first name';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter a valid first name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: value,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _initialValues['lastName'],
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s last name',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        focusNode: _lastNameFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_professionFocusNode);
                        },
                        validator: (value) {
                          String pattern = r'(^[a-zA-Z]*$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value.length == 0) {
                            return 'Please enter a last name';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter a valid last name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: value,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _initialValues['profession'],
                        decoration: InputDecoration(
                          labelText: 'Profession',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s profession',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _professionFocusNode,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_gradeFocusNode);
                        },
                        validator: (value) {
                          String pattern = r'(^[a-zA-Z ]*$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value.length == 0) {
                            return 'Please enter a profession';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter a valid profession';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: value,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _initialValues['grade'],
                        decoration: InputDecoration(
                          labelText: 'Grade',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s grade',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _gradeFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_emailFocusNode);
                        },
                        validator: (value) {
                          String pattern = r'(^[0-9.]*$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value.length == 0) {
                            return 'Please enter a grade';
                          }
                          if (double.tryParse(value) < 5) {
                            return 'Number 5 is the min grade!';
                          }
                          if (double.tryParse(value) > 10) {
                            return 'Number 10 is the max grade!';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter a valid grade';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: value,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        initialValue: _initialValues['email'],
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s email address',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _emailFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_numberFocusNode);
                        },
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value))
                            return 'Enter Valid Email';
                          else
                            return null;
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: value,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _initialValues['phoneNumber'],
                        decoration: InputDecoration(
                          labelText: 'Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s phone number',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        focusNode: _numberFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_categoryIdFocusNode);
                        },
                        validator: (value) {
                          String pattern = r'^\+?383[0-9]{8}$';
                          RegExp regExp = new RegExp(pattern);
                          if (value.length == 0) {
                            return 'Please enter mobile number';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter valid mobile number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: value,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        initialValue: _initialValues['categoriesId'],
                        decoration: InputDecoration(
                            labelText: 'Categories',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s category ID',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _categoryIdFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_biographyFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a category id!';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: value,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        maxLines: 2,
                        initialValue: _initialValues['biography'],
                        decoration: InputDecoration(
                            labelText: 'Biography',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s biography',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        focusNode: _biographyFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a bio!';
                          }
                          if (value.length < 10) {
                            return 'Should be at least 10 characters long.';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: value,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        initialValue: _initialValues['instagram'],
                        decoration: InputDecoration(
                          labelText: 'Instagram',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s instagram username',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _instagramFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_facebookFocusNode);
                        },
                        validator: _socialMedia,
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: value,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _initialValues['facebook'],
                        decoration: InputDecoration(
                          labelText: 'Facebook',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          hintText: 'Enter student\'s facebook username',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _facebookFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_linkedInFocusNode);
                        },
                        validator: _socialMedia,
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: value,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _initialValues['linkedIn'],
                        decoration: InputDecoration(
                          labelText: 'LinkedIn',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s linkedIn username',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _linkedInFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_twitterFocusNode);
                        },
                        validator: _socialMedia,
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: value,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _initialValues['twitter'],
                        decoration: InputDecoration(
                          labelText: 'Twitter',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter student\'s twitter username',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _twitterFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_imageUrlFocusNode);
                        },
                        validator: _socialMedia,
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: _editedStudent.imageUrl,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: value,
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'ImageUrl',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter a imageUrl',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        focusNode: _imageUrlFocusNode,
                        controller: _imageUrlController,
                        // onFieldSubmitted: (_){
                        //   _saveForm();
                        // },
                        validator: (value) {
                          // String pattern = r'^(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)$';
                          // RegExp regExp = new RegExp(pattern);
                          if (value.length == 0) {
                            return 'Please enter a imageUrl';
                          }
                          // else if (!regExp.hasMatch(value)) {
                          //   return 'Please enter valid imageUrl';
                          // }
                          return null;
                        },
                        onSaved: (value) {
                          _editedStudent = StudentModel(
                            id: _editedStudent.id,
                            isFavorite: _editedStudent.isFavorite,
                            categoriesId: _editedStudent.categoriesId,
                            imageUrl: value,
                            firstName: _editedStudent.firstName,
                            lastName: _editedStudent.lastName,
                            profession: _editedStudent.profession,
                            grade: _editedStudent.grade,
                            email: _editedStudent.email,
                            phoneNumber: _editedStudent.phoneNumber,
                            biography: _editedStudent.biography,
                            instagram: _editedStudent.instagram,
                            facebook: _editedStudent.facebook,
                            linkedIn: _editedStudent.linkedIn,
                            twitter: _editedStudent.twitter,
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            )),
                        child: _imageUrlController.text.isEmpty
                            ? Center(
                          child: Text(
                            'Image Url',
                          ),
                        )
                            : FittedBox(
                          child: Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: _saveForm,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'ADD STUDENT',
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
