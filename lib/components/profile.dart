import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _selectedFile;
  final picker = ImagePicker();
  bool _inProcess = false;
  String _gender = 'Male';

  Future selectOrTakePhoto(ImageSource imageSource) async {
    setState(() {
      _inProcess = true;
    });
    final pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      File? croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              // toolbarColor: Color(0xFF0A4D50),
              toolbarColor: Color(0xFF0A4D50)));

      this.setState(() {
        _selectedFile = croppedFile;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  Future _showSelectionDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select photo'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('From gallery'),
              onPressed: () {
                selectOrTakePhoto(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: Text('Take a photo'),
              onPressed: () {
                selectOrTakePhoto(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              child: Container(
                width: 200,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                _showSelectionDialog();
                              },
                              child: Container(
                                width: 144.0,
                                height: 144.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(72.0)),
                                    color: Colors.white),
                                child: _selectedFile == null
                                    ? CircleAvatar(
                                        radius: 72.0,
                                        backgroundImage: AssetImage(
                                            'assets/images/app_icon.png'),
                                        backgroundColor: Colors.white,
                                      )
                                    : CircleAvatar(
                                        radius: 72.0,
                                        backgroundImage:
                                            FileImage(_selectedFile!),
                                        backgroundColor: Colors.white,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          _showSelectionDialog();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28.0)),
                              color: Color(0xFFD5E1E1)),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28.0)),
                                color: Colors.black),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      top: 18,
                      right: 10,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full name',
                  hintText: 'Full Name',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.card_travel)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone number',
                hintText: 'Phone Number',
                fillColor: Colors.white,
                filled: true,
//                    prefixIcon: ImageIcon(Image.asset('assets/images/phone_naija.svg'), ),
              ),
              // The validator receives the text that the user has entered.                    prefixIcon: ImageIcon(Image.asset()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (!RegExp('^(?:[+0]234)?[0-9]{10}').hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email address',
                hintText: 'Email Address',
                prefixIcon: Icon(Icons.email),
                fillColor: Colors.white,
                filled: true,
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    decoration: BoxDecoration(
                      color:
                          _gender == 'Male' ? Color(0xFFD4B581) : Colors.white,
                      border: Border.all(
                          color: _gender == 'Male'
                              ? Color(0xFFD4B581)
                              : Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: ElevatedButton(
                      onPressed: () => {
                        setState(() {
                          _gender = 'Male';
                        })
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _gender == 'Male'
                            ? Color(0xFFD4B581)
                            : Colors.white,
                        onPrimary:
                            _gender == 'Male' ? Color(0xFFD4B581) : Colors.grey,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        width: double.infinity,
                        child: Text(
                          'Male',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _gender == 'Male'
                                ? Colors.black
                                : Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      color: _gender == 'Female'
                          ? Color(0xFFD4B581)
                          : Colors.white,
                      border: Border.all(
                          color: _gender == 'Female'
                              ? Color(0xFFD4B581)
                              : Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: ElevatedButton(
                      onPressed: () => {
                        setState(() {
                          _gender = 'Female';
                        })
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _gender == 'Female'
                            ? Color(0xFFD4B581)
                            : Colors.white,
                        onPrimary: _gender == 'Female'
                            ? Color(0xFFD4B581)
                            : Colors.grey,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        width: double.infinity,
                        child: Text(
                          'Female',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _gender == 'Female'
                                ? Colors.black
                                : Colors.black54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Change Password',
                hintText: 'Change Password',
                fillColor: Colors.white,
                filled: true,
              ),
              // The validator receives the text that the user has entered.                    prefixIcon: ImageIcon(Image.asset()),
              validator: (value) {
//                if (value == null || value.isEmpty) {
//                  return 'Please enter your phone number';
//                }
//                if(!RegExp('^(?:[+0]234)?[0-9]{10}').hasMatch(value)) {
//                  return 'Please enter a valid phone number';
//                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Save Changes',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.black,
                onPrimary: Colors.white,
              ),
            )
          ],
        ),
        (_inProcess)
            ? Container(
                color: Color(0xFFD5E1E1),
                height: MediaQuery.of(context).size.height * 0.96,
                child: Center(
                  child: CircularProgressIndicator(color: Color(0xFF0A4D50)),
                ),
              )
            : Center()
      ],
    );
  }
}
