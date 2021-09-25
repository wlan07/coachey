import 'package:flutter/material.dart';

class SuggestionHorizontalView extends StatelessWidget {
  const SuggestionHorizontalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.0),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: DefaultTextStyle(
        style: TextStyle(
            fontFamily: "Space", fontSize: 20.0, color: Color(0xff2843ed)),
        child: Row(
          children: [
            ...List.generate(
              20,
              (index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "element$index",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
