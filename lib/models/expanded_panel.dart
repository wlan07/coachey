import 'package:flutter/rendering.dart';

class ExpandedModel {

  final String title;
  final String trailing;
  final Color color;
  final Alignment alignment;
  final Color textColor;

  const ExpandedModel(
      {required this.textColor,
      required this.title,
      required this.color,
      required this.alignment,
      required this.trailing});

}
