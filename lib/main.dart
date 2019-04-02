import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learnswedish/ui/screens/home.dart';

void main() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(LearningSwedishApp());
}

class LearningSwedishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Learn Swedish",
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: HomeScreen()
    );
  }
}