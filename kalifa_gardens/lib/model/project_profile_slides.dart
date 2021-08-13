import 'package:flutter/material.dart';

class ProjectSlide {
  final String image;
  final String title;
  ProjectSlide({@required this.image, @required this.title});
}

final projSlideList = [
  ProjectSlide(image: "assets/images/stub_image_1.png", title: "Condominium and Lake"),
  ProjectSlide(image: "assets/images/slide2.png", title: "Condominium and Lake 2"),
  ProjectSlide(image: "assets/images/stub_image_1.png", title: "Condominium and Lake 3"),
  ProjectSlide(image: "assets/images/slide3.png", title: "Condominium and Lake 4")
];