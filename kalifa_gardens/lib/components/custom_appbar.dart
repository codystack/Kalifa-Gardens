import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget customAppbar() => AppBar(
  title: SvgPicture.asset('assets/images/kalifa_gardens.svg'),
  leading: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Image.asset(
          'assets/images/app_icon.png',
          width: 40.0,
          height: 40.0,
        ),
      ),
    ],
  ),
  actions: [
    IconButton(
      onPressed: () => {},
      icon: Icon(Icons.notifications),
    ),
    IconButton(
      onPressed: () => {},
      icon: Icon(Icons.menu),
    ),
  ],
);
