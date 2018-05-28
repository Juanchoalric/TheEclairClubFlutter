import 'package:flutter/material.dart';
import 'package:the_eclair_club/home_recipe_screen.dart';
import 'package:the_eclair_club/menu_screen.dart';
import 'package:the_eclair_club/other_screen.dart';
import 'package:the_eclair_club/zoom_scaffold.dart';
import 'theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'The Eclair Club',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var activeScreen = recipeScreen;

  @override
  Widget build(BuildContext context) {
    return new ZoomScatffold(
      menuScreen: MenuScreen(),
      contentScreen: activeScreen,
    );
  }
}
