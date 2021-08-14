import '../forms/contact_us.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();

//  final Widget widget;
////  final String title;
////
////  CustomDialog(this.widget, this.title);
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Color(0xFFE8E8E8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A4D50)),
                  )
                ],
              ),
            ),
            ContactUs(),
          ],
        ),
      ),
    );
  }
}
