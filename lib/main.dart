import 'package:flutter/material.dart';
import 'package:learnswedish/ui/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learnswedish/ui/screens/home.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Brightness brightness = (prefs.getBool("isDark") ?? false) ? Brightness.dark: Brightness.light;
  runApp(LearningSwedishApp());
}

class LearningSwedishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Learn Swedish",
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
      ),
      home: HomeScreen()
    );
  }
}