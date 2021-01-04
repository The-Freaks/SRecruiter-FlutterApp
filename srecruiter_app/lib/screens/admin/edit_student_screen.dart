import 'package:flutter/material.dart';

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

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
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
    super.dispose();
  }

  void _updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_lastNameFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    focusNode: _lastNameFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_professionFocusNode);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Profession'),
                    textInputAction: TextInputAction.next,
                    focusNode: _professionFocusNode,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_gradeFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Grade'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _gradeFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_numberFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Number'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    focusNode: _numberFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_categoryIdFocusNode);
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Categories'),
              textInputAction: TextInputAction.next,
              focusNode: _categoryIdFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_biographyFocusNode);
              },
            ),
            TextFormField(
              maxLines: 2,
              decoration: InputDecoration(labelText: 'Biography'),
              keyboardType: TextInputType.multiline,
              focusNode: _biographyFocusNode,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Instagram'),
                    textInputAction: TextInputAction.next,
                    focusNode: _instagramFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_facebookFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Facebook'),
                    textInputAction: TextInputAction.next,
                    focusNode: _facebookFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_linkedInFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'LinkedIn'),
                    textInputAction: TextInputAction.next,
                    focusNode: _linkedInFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_twitterFocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Twitter'),
                    textInputAction: TextInputAction.next,
                    focusNode: _twitterFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_imageUrlFocusNode);
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'ImageUrl'),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.url,
                    focusNode: _imageUrlFocusNode,
                    controller: _imageUrlController,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
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
                ),
              ],
            ),
            // Container(
            //   height: 100,
            //   width: double.infinity,
            //   margin: const EdgeInsets.only(top: 10),
            //   decoration: BoxDecoration(
            //       border: Border.all(
            //         width: 1,
            //         color: Colors.grey,
            //       )),
            //   child: _imageUrlController.text.isEmpty
            //       ? Center(
            //     child: Text(
            //       'Image Url',
            //     ),
            //   )
            //       : FittedBox(
            //     child: Image.network(
            //       _imageUrlController.text,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
          ],
        )),
      ),
    );
  }
}
