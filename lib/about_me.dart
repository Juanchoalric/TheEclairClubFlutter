import 'package:flutter/material.dart';
import 'package:the_eclair_club/zoom_scaffold.dart';

final aboutMe = new Screen(
  title: 'About Me',
  background: new DecorationImage(
      image: new AssetImage('assets/light-pink-solid-color-background.jpg'),
  fit: BoxFit.cover,
  ),
  contentBuilder: (BuildContext context){
    return new Container();
  }
);