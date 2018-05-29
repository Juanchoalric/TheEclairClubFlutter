import 'package:flutter/material.dart';
import 'package:the_eclair_club/theme.dart';
import 'package:the_eclair_club/zoom_scaffold.dart';

final Screen recipeScreen = new Screen(
    title: 'Home Sweet Home',
    background: new DecorationImage(
        image: new AssetImage('assets/light-pink-solid-color-background.jpg'),
        fit: BoxFit.cover),
    contentBuilder: (BuildContext context) {
      return ListView.builder(
          itemCount: recipesList.recipes.length,
          itemBuilder: (context, i) {
            final recipe = recipesList.recipes[i];
            return new Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: new Card(
                elevation: 10.0,
                child: new Column(
                  children: <Widget>[
                    new Image.asset(
                      recipe.firstImage,
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
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(15.0)),
                            ),
                            child: new Icon(
                              Icons.fastfood,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                recipe.title,
                                style: const TextStyle(
                                    fontSize: 25.0, fontFamily: "Handlee"),
                              ),
                              new Text(
                                recipe.subTitle,
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
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: new Column(
                            children: <Widget>[
                              new Icon(
                                Icons.favorite_border,
                                color: primaryDarkColor,
                              ),
                              new Text(recipe.likes.toString()),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    });

final recipesList = new Recipes(
  recipes: [
    new Recipe(
      firstImage: "assets/postre1.jpg",
      secondImage: "assets/postre1.jpg",
      thirdImage: "assets/postre1.jpg",
      fourthImage: "assets/postre1.jpg",
      title: "Li Diccone",
      subTitle: "The best cake ever to exist",
      text:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
      ingredients: "Milk|Eggs|Chocolate|Strawberries",
      stepsToPrepare:
          "Put the cake inside the oven|Then put it inside the fridge|Microwave for 50 seconds",
      likes: 60,
    ),
    new Recipe(
      firstImage: "assets/postre1.jpg",
      secondImage: "assets/postre1.jpg",
      thirdImage: "assets/postre1.jpg",
      fourthImage: "assets/postre1.jpg",
      title: "Li Diccone",
      subTitle: "The best cake ever to exist",
      text:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
      ingredients: "Milk|Eggs|Chocolate|Strawberries",
      stepsToPrepare:
          "Put the cake inside the oven|Then put it inside the fridge|Microwave for 50 seconds",
      likes: 60,
    ),
    new Recipe(
      firstImage: "assets/postre1.jpg",
      secondImage: "assets/postre1.jpg",
      thirdImage: "assets/postre1.jpg",
      fourthImage: "assets/postre1.jpg",
      title: "Li Diccone",
      subTitle: "The best cake ever to exist",
      text:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
      ingredients: "Milk|Eggs|Chocolate|Strawberries",
      stepsToPrepare:
          "Put the cake inside the oven|Then put it inside the fridge|Microwave for 50 seconds",
      likes: 60,
    ),
    new Recipe(
      firstImage: "assets/postre1.jpg",
      secondImage: "assets/postre1.jpg",
      thirdImage: "assets/postre1.jpg",
      fourthImage: "assets/postre1.jpg",
      title: "Li Diccone",
      subTitle: "The best cake ever to exist",
      text:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
      ingredients: "Milk|Eggs|Chocolate|Strawberries",
      stepsToPrepare:
          "Put the cake inside the oven|Then put it inside the fridge|Microwave for 50 seconds",
      likes: 60,
    ),
    new Recipe(
      firstImage: "assets/postre1.jpg",
      secondImage: "assets/postre1.jpg",
      thirdImage: "assets/postre1.jpg",
      fourthImage: "assets/postre1.jpg",
      title: "Li Diccone",
      subTitle: "The best cake ever to exist",
      text:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
      ingredients: "Milk|Eggs|Chocolate|Strawberries",
      stepsToPrepare:
          "Put the cake inside the oven|Then put it inside the fridge|Microwave for 50 seconds",
      likes: 60,
    ),
    new Recipe(
      firstImage: "assets/postre1.jpg",
      secondImage: "assets/postre1.jpg",
      thirdImage: "assets/postre1.jpg",
      fourthImage: "assets/postre1.jpg",
      title: "Li Diccone",
      subTitle: "The best cake ever to exist",
      text:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
      ingredients: "Milk|Eggs|Chocolate|Strawberries",
      stepsToPrepare:
          "Put the cake inside the oven|Then put it inside the fridge|Microwave for 50 seconds",
      likes: 60,
    ),
    new Recipe(
      firstImage: "assets/postre1.jpg",
      secondImage: "assets/postre1.jpg",
      thirdImage: "assets/postre1.jpg",
      fourthImage: "assets/postre1.jpg",
      title: "Li Diccone",
      subTitle: "The best cake ever to exist",
      text:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
      ingredients: "Milk|Eggs|Chocolate|Strawberries",
      stepsToPrepare:
          "Put the cake inside the oven|Then put it inside the fridge|Microwave for 50 seconds",
      likes: 60,
    ),
  ],
);

class Recipe {
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;
  final String title;
  final String subTitle;
  final String text;
  final String ingredients;
  final String stepsToPrepare;
  final int likes;

  Recipe({
    this.firstImage,
    this.secondImage,
    this.thirdImage,
    this.fourthImage,
    this.title,
    this.subTitle,
    this.text,
    this.ingredients,
    this.stepsToPrepare,
    this.likes,
  });
}

class Recipes {
  final List<Recipe> recipes;

  Recipes({
    this.recipes,
  });
}