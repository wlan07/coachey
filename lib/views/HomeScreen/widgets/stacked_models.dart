import 'package:coach_finder/views/HomeScreen/widgets/bottom_nav_bar.dart';
import 'package:coach_finder/views/HomeScreen/widgets/expanded_panel.dart';
import 'package:flutter/material.dart';

import '../../../models/expanded_panel.dart';


class StackedPanels extends StatelessWidget {
  const StackedPanels({Key? key}) : super(key: key);


  static const List<ExpandedModel> _list = [
    ExpandedModel(
        textColor: Colors.white,
        alignment: Alignment.centerLeft,
        color: Color(0xff080517),
        title: "TOP CHALLENGES",
        trailing: "256"),
    ExpandedModel(
        textColor: Colors.white,
        alignment: Alignment.centerRight,
        color: Color(0xff1f1edb),
        title: "POPULAR COACHES",
        trailing: "05"),
    ExpandedModel(
        textColor: Colors.blue,
        alignment: Alignment.centerLeft,
        color: Colors.white,
        title: "FOR YOU",
        trailing: "120")
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final topMargin = constraints.maxHeight * 0.2;
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          alignment: Alignment.center,
          children: [
            ...List.generate(
                _list.length,
                (index) => Positioned(
                      top: topMargin * index,
                      left: _list[index].alignment == Alignment.centerLeft
                          ? -20.0
                          : 20.0,
                      width: width,
                      height: height,
                      child: ExpandedPanel(
                        model: _list[index],
                      ),
                    )),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(
                height: height,
              )
            )
          ],
        );
      },
    );
  }
}
