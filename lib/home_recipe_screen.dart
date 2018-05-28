import 'package:flutter/material.dart';
import 'package:the_eclair_club/theme.dart';
import 'package:the_eclair_club/zoom_scaffold.dart';

final Screen recipeScreen = new Screen (
    title: 'Home Sweet Home',
    background: new DecorationImage(
        image: new AssetImage('assets/light-pink-solid-color-background.jpg'),
        fit: BoxFit.cover),
    contentBuilder: (BuildContext context){
      return ListView(
        children: <Widget>[
          new _RecipeCard(
            headImageAssetPath: "assets/postre1.jpg",
            icon: Icons.fastfood,
            title: "Il Domacca",
            subtitle: "Best Cake ever",
            heartCount: 203,
          ),
          new _RecipeCard(
            headImageAssetPath: "assets/postre2.jpg",
            icon: Icons.local_dining,
            title: "Pasta Ricotta",
            subtitle: "Best Pasta ever",
            heartCount: 123,
          ),
          new _RecipeCard(
            headImageAssetPath: "assets/postre3.jpg",
            icon: Icons.fastfood,
            title: "Red Limonade",
            subtitle: "Best Drink ever",
            heartCount: 453,
          ),
        ],
      );
    }
);




class _RecipeCard extends StatelessWidget {
  final String headImageAssetPath;
  final IconData icon;
  final String title;
  final String subtitle;
  final int heartCount;

  _RecipeCard({
    this.headImageAssetPath,
    this.icon,
    this.title,
    this.subtitle,
    this.heartCount,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: new Card(
        elevation: 10.0,
        child: new Column(
          children: <Widget>[
            new Image.asset(
              headImageAssetPath,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: primaryDarkColor,
                      borderRadius:
                      new BorderRadius.all(const Radius.circular(15.0)),
                    ),
                    child: new Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        title,
                        style: const TextStyle(
                            fontSize: 25.0, fontFamily: "Handlee"),
                      ),
                      new Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Varela Round Regular",
                          color: textLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                          textLightColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(
                        Icons.favorite_border,
                        color: primaryDarkColor,
                      ),
                      new Text(heartCount.toString()),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}