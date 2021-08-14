import '../model/project_profile_slides.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectProfileSlideItem extends StatelessWidget {
  final int index;
  ProjectProfileSlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Image.asset(
          projSlideList[index].image!,
          fit: BoxFit.fill,
          height: 236,
        )),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    projSlideList[index].title!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
