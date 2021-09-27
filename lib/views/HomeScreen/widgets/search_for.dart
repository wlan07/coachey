import 'package:flutter/material.dart';
import 'package:coach_finder/extensions/my_extensions.dart';

class SearchFor extends StatelessWidget {
  const SearchFor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 25.0, right: 25.0, top: 50.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "SEARCH FOR YOUR",
            textAlign: TextAlign.center,
            style: TextStyle(
              shadows: [Shadow(color: Color(0xff080517), blurRadius: 5.0)],
            ),
          ).scaleDown(),
          Text(
            "NEXT CHALLENGE",
            textAlign: TextAlign.center,
            style: TextStyle(
              shadows: [Shadow(color: Color(0xff080517), blurRadius: 5.0)],
            ),
          ).scaleDown(),
        ],
      ),
    );
  }
}
