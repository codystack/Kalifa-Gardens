import 'package:flutter/material.dart';

class TextSpectral extends StatelessWidget {
  late final String? text;
  late final double? fontSize;
  late final Color? color;
  late final TextAlign? align;
  late final FontWeight? fontWeight;
  late final FontStyle? fontStyle;
  late final bool? softWrap;
  late final double? lineHeight;

  TextSpectral({
    required this.text,
    this.color,
    required this.fontSize,
    this.fontWeight,
    this.align,
    this.fontStyle,
    this.softWrap,
    this.lineHeight,
  });

  final fontFamily = "Spectral";

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      softWrap: softWrap,
      textAlign: align,
      style: TextStyle(
        height: lineHeight,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
      ),
    );
  }
}

class TextRoboto extends StatelessWidget {
  late final String? text;
  late final double? fontSize;
  late final Color? color;
  late final FontWeight? fontWeight;
  late final TextAlign? align;

  TextRoboto(
      {required this.text,
      this.color,
      required this.fontSize,
      this.fontWeight,
      this.align});

  final fontFamily = "Roboto";

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
