import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_eclair_club/category_recipes.dart';
import 'package:the_eclair_club/help_me_grow.dart';
import 'package:the_eclair_club/home_recipe_screen.dart';
import 'package:the_eclair_club/menu_screen.dart';
import 'package:the_eclair_club/about_me.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:the_eclair_club/zoom_scaffold.dart';

import 'package:firebase_core/firebase_core.dart';




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

  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'home_recipes',
        title: 'HOME RECIPES'
      ),
      new MenuItem(
        id: 'category_recipes',
        title: 'CATEGORY RECIPES'
      ),
      new MenuItem(
        id: 'about_me',
        title: 'ABOUT ME'
      ),
      new MenuItem(
        id: 'help_me_grow',
        title: 'HELP ME GROW'
      ),
    ],
  );

  var selectedMenuItemId = 'home_recipes';

  var activeScreen = recipeScreen;

  @override
  Widget build(BuildContext context) {
    return new ZoomScatffold(
      menuScreen: MenuScreen(
        menu: menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId){
          selectedMenuItemId = itemId;
          if(itemId == 'home_recipes'){
            setState(() => activeScreen = recipeScreen);
          } else if (itemId == 'about_me'){
            setState(() => activeScreen = aboutMe);
          } else if (itemId == 'help_me_grow'){
            setState(() => activeScreen = helpMeGrow);
          } else {
            setState(() => activeScreen = categoryRecipes);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
