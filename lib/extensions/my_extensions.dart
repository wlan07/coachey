import 'package:flutter/material.dart';

extension WidgetExten on Widget {
  Widget scaleDown({Alignment? alignment}) {
    return FittedBox(
        alignment: alignment ?? Alignment.center,
        child: this,
        fit: BoxFit.scaleDown);
  }
}
