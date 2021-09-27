import 'dart:developer';
import 'package:coach_finder/views/HomeScreen/widgets/search_box.dart';
import 'package:coach_finder/views/HomeScreen/widgets/search_for.dart';
import 'package:coach_finder/views/HomeScreen/widgets/stacked_models.dart';
import 'package:coach_finder/views/HomeScreen/widgets/suggestion_horizontal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // QUIT THE FULL SCREEN MODE
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("HOME SCREEN BUILDED");

    return Material(
      color: Color(0xff546bff),
      child: DefaultTextStyle(
        maxLines: 2,
        style:
            TextStyle(color: Colors.white, fontSize: 45.0, fontFamily: "LuckiestGuy"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SearchFor(),
            const SearchBox(),
            const SuggestionHorizontalView(),
            const Spacer(),
            const Expanded(flex: 5, child: StackedPanels())
          ],
        ),
      ),
    );
  }
}
