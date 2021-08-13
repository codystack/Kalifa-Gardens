import 'dart:io';

import 'package:demo_app/controller/state_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class PurchasePlotStep4 extends StatefulWidget {

  var stepIndex;

  PurchasePlotStep4({this.stepIndex});

  @override
  _PurchasePlotStep4State createState() => _PurchasePlotStep4State();
}

class _PurchasePlotStep4State extends State<PurchasePlotStep4> {

  bool _isTransfer = false, _isCard = false, _isDraft = false, _isDefault = true;
  final _controller = Get.find<StateController>();
  File _file;
  String _accountHolderName;
  String _fileName;
  List<XFile> photos = [];
  bool _isPicked = false, _isNotSelected = false;

  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();


  void _pickFromGallery() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if(result != null) {
      _file = File(result.files.single.path);
      PlatformFile file = result.files.first;
      _fileName = file.name;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }

  _openCamera() async{
    XFile photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      if (photo.path != null) {
        setState(() {
          photos.add(photo);
        });
      }
    }
  }

  _openGallery() async{
    List<XFile> photoList = await _picker.pickMultiImage();

    if (photoList != null) {
      for (var k=0; k<photoList.length; k++) {
        setState(() {
          photos.add(photoList[k]);
        });
      }
//      if (photo.path != null) {
//        setState(() {
//          _isPicked = true;
//          _isNotSelected = false;
//        });
//      }
    }
  }

  _openChooser() {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 3.0,
          child: Container(
            height: 186.0,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(48.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                        _openCamera();
                      },
                      icon: Icon(Icons.camera_alt_outlined, size: 48, color: Color(0xFF0A4D50,),
                      ),
                    ),
                    Text(
                      'Camera',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0A4D50),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                        _openGallery();
                      },
                      icon: Icon(Icons.folder_open, size: 48, color: Color(0xFF0A4D50,),
                      ),
                    ),
                    Text(
                      'Gallery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0A4D50),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Proof of Payment',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Color(0xFF0A4D50),
              fontWeight: FontWeight.w700,
              fontSize: 20
          ),
        ),
        SizedBox(height: 21.0,),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 16.0,),
              TextFormField(
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account Holder\'s Name',
                  hintText: 'Account Holder\'s Name',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Account holder\'s name is required';
                  }
                  return null;
                },
                onSaved: (name) {
                  _accountHolderName = name;
                },
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 10.0,),
              DottedBorder(
                color: Color(0x1F0A4D50),
                strokeWidth: 3.0,
                borderType: BorderType.Rect,
                dashPattern: [10, 3],
                child: Container(
                  height: 312,
                  width: double.infinity,
                  color: Color(0x2B0A4D50),
                  // ignore: null_aware_before_operator
                  child: (photos??[]).length > 0 ?
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        children: [
                          for (var i=0; i<photos.length; i++)
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topRight,
                              children: [
                                Image.file(File(photos[i].path), fit: BoxFit.contain,),
                                Positioned(
                                  child: Container(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          photos.removeAt(i);
                                          _isPicked = false;
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                                        color: Color(0x72FFFFFF)
                                    ),
                                  ),
                                  top: 5,
                                  right: 5,
                                )
                              ],
                            ),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                onPressed: () => _openChooser()   ,
                                icon: Icon(Icons.add, size: 24,),
                                label: Text('Add more', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFD4B581),
                                onPrimary: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                      :
                  TextButton(
                    onPressed: () => _openChooser(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/cloud_upload.svg'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Upload Proof of Payment', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0x8C000000)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _isNotSelected ? Text('No image selected', style: TextStyle(color: Colors.redAccent)) : SizedBox(),
                        )
                      ],
                    ),
                    style: TextButton.styleFrom(
                        primary: Color(0x2B0A4D50),
                        padding: const EdgeInsets.all(36.0)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (photos.length > 0) {
                        //All good
                        _controller.increment();
                      }
                      else {
                        setState(() {
                          _isNotSelected = true;
                        });
                      }
                    }
                  },
                  child: Text(
                    'Complete',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(16.0)
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
