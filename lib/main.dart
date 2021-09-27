import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/HomeScreen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();



  // ENTER THE FULL SCREEN MODE
  await SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(const MyApp());

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

