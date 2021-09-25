import 'package:flutter/material.dart';

import 'bottomnavbarclipper.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.height}) : super(key: key);

  final double height;

  static const List<IconData> icons = [
    Icons.home_outlined,
    Icons.message_outlined,
    Icons.person_outline_outlined,
    Icons.search
  ];

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomNavClipper(),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: height * 0.3,
        width: double.infinity,
        color: Color(0xffD6CDEE),
        child: SizedBox(
          height: height * 0.3 * 0.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              ...icons.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Icon(e,
                        color: icons.indexOf(e) == 3
                            ? Colors.pink.withOpacity(0.5)
                            : Colors.grey),
                  )),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
