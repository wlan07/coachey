import 'package:coach_finder/search_box.dart';
import 'package:coach_finder/suggestion_horizontal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart' as fonts;

import 'stacked_models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coachey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff546bff),
      child: DefaultTextStyle(
        style: fonts.GoogleFonts.bebasNeue().copyWith(
          color: Colors.white,
          fontSize: 70.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 50.0, bottom: 10.0),
              child: Text(
                "SEARCH FOR YOUR NEXT CHALLENGE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: [Shadow(color: Color(0xff080517), blurRadius: 5.0)],
                ),
              ),
            ),
            const SearchBox(),
            const SuggestionHorizontalView(),
            const Spacer(
            ),
            const Expanded(
              flex: 5,
              child: StackedModels()
            )
          ],
        ),
      ),
    );
  }
}
