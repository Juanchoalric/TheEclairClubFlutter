import 'package:flutter/material.dart';
import 'package:the_eclair_club/theme.dart';
import 'package:the_eclair_club/zoom_scaffold.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuState createState() => new _MenuState();
}

class _MenuState extends State<MenuScreen> {

  createMenuTitle(){
    return Transform(
      transform: new Matrix4.translationValues(
        -100.0,
        0.0,
        0.0,
      ),
      child: new OverflowBox(
        maxWidth: double.infinity,
        alignment: Alignment.topLeft,
        child: new Padding(
          padding: const EdgeInsets.all(30.0),
          child: new Text(
            'Eclair',
            style: new TextStyle(
              color: primaryLightColor,
              fontSize: 200.0,
              fontFamily: 'Handlee',
            ),
            textAlign: TextAlign.left,
            softWrap: false,
          ),
        ),
      ),
    );
  }



  createMenuItems(MenuController menuController){
    return new Transform(
      transform: new Matrix4.translationValues(0.0, 220.0, 0.0),
      child: new Column(
        children: <Widget>[
          new _MenuListItems(
            title: 'Home Recipe',
            isSelected: true,
            onTap: (){
              menuController.close();
              },
          ),
          new _MenuListItems(
            title: 'Catalog Recipe',
            isSelected: false,
            onTap: (){
              menuController.close();
              },
          ),
          new _MenuListItems(
            title: 'About Me',
            isSelected: false,
            onTap: (){ menuController.close();},
          ),
          new _MenuListItems(
            title: 'Settings',
            isSelected: false,
            onTap: (){ menuController.close();},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffodMenuController(
      builder: (BuildContext context, MenuController menuController) {
        return new Container(
          width: double.infinity,
          height: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('assets/white-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Material(
            color: Colors.transparent,
            child: new Stack(
              children: <Widget>[
                createMenuTitle(),
                createMenuItems(menuController),
              ],
            ),
          ),
        );
      }
    );
  }
}

class _MenuListItems extends StatelessWidget {

  final String title;
  final bool isSelected;
  final Function() onTap;

  _MenuListItems({
    this.title,
    this.isSelected,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      splashColor: secondaryLightColor,
      onTap: isSelected
          ? null : onTap,
      child: new Container(
        width: double.infinity,
        child: new Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
          child: new Text(
            title,
            style: new TextStyle(
              color: isSelected ? primaryColor: secondaryColor,
              fontFamily: 'Shadows Into Light',
              fontSize: 24.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}


