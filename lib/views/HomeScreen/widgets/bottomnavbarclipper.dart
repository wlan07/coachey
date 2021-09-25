import 'package:flutter/material.dart';

class BottomNavClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    return Path()
    ..quadraticBezierTo(size.width*0.05,size.height*0.5, size.width*0.2, size.height*0.5)
    ..lineTo(size.width*0.8, size.height*0.5)
    ..quadraticBezierTo(size.width*.95,size.height*0.5, size.width, 0)
    ..lineTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..close();

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}