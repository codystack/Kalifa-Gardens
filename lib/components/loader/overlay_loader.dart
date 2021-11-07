import 'package:flutter/material.dart';
import 'package:kalifa_gardens/util/constants.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class OverlayLoader extends StatelessWidget {
  const OverlayLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingBouncingLine.circle(
      borderColor: Constants.accentColor,
      borderSize: 3.0,
      size: 120.0,
      backgroundColor: Constants.accentColor,
      duration: Duration(milliseconds: 700),
    );
  }
}
