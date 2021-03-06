import 'package:flutter/material.dart';
import 'package:the_eclair_club/theme.dart';

class DetailRecipePage extends StatefulWidget {
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;
  final String title;
  final String subTitle;
  final String introductionText;
  final String secondText;
  final String endingText;
  final String ingredients;
  final String stepsToPrepare;
  final int likes;
  final String category;

  DetailRecipePage({
    Key key,
    this.firstImage,
    this.secondImage,
    this.thirdImage,
    this.fourthImage,
    this.title,
    this.subTitle,
    this.introductionText,
    this.secondText,
    this.endingText,
    this.ingredients,
    this.stepsToPrepare,
    this.likes,
    this.category,
  }) : super(key: key);

  @override
  _DetailRecipePageState createState() => new _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primaryColor,
        title: new Text(
          "${widget.title}",
          style: new TextStyle(
              fontFamily: "Shadows Into Light", color: Colors.white),
        ),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Description",
            ),
            new Tab(
              text: "Ingredients",
            ),
            new Tab(
              text: "Steps",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new DescriptionRecipe(
            firstImage: widget.firstImage,
            secondImage: widget.secondImage,
            thirdImage: widget.thirdImage,
            introductionText: widget.introductionText,
            secondText: widget.secondText,
            endingText: widget.endingText,
            fourthImage: widget.fourthImage,
            category: widget.category,
          ),
          new IngredientsRecipe(
            ingredientsRecipe: widget.ingredients,
          ),
          new StepsRecipe(
            stepsToPrepare: widget.stepsToPrepare,
          ),
        ],
      ),
    );
  }
}

class DescriptionRecipe extends StatelessWidget {
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;
  final String introductionText;
  final String secondText;
  final String endingText;
  final String category;

  DescriptionRecipe({
    this.firstImage,
    this.secondImage,
    this.thirdImage,
    this.fourthImage,
    this.introductionText,
    this.secondText,
    this.endingText,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    
    return new SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
        new Container(
          child: new Image.asset(firstImage, fit: BoxFit.cover,),
          height: 300.0,
          width: double.infinity,
        ),
        new Container(child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(introductionText, style: new TextStyle(color: textColor, fontFamily: "Roboto Regular", fontSize: 18.0),),
        )),
        new Container(
          child: new Image.asset(secondImage, fit: BoxFit.cover,),
          height: 300.0,
          width: double.infinity,
        ),
        new Container(child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(secondText, style: new TextStyle(color: textColor, fontFamily: "Roboto Regular", fontSize: 18.0),),
        )),
        new Container(
          child: new Image.asset(thirdImage, fit: BoxFit.cover,),
          height: 300.0,
          width: double.infinity,
        ),
        new Container(child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(endingText, style: new TextStyle(color: textColor, fontFamily: "Roboto Regular", fontSize: 18.0),),
        )),
        new Container(
          child: new Image.asset(firstImage, fit: BoxFit.cover,),
          height: 300.0,
          width: double.infinity,
        ),
      ],
      ),
    );
  }
}

class IngredientsRecipe extends StatelessWidget {
  final String ingredientsRecipe;

  IngredientsRecipe({
    this.ingredientsRecipe,
  });
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(
          delegate: new SliverChildListDelegate(
              buildTextView(ingredientsRecipe.split("|").length)),
        ),
      ],
    );
  }

  List buildTextView(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text("${ingredientsRecipe.split("|")[i]}"),
      ));
    }
    return strings;
  }
}

class StepsRecipe extends StatelessWidget {
  final String stepsToPrepare;

  StepsRecipe({
    this.stepsToPrepare,
  });
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(
          delegate: new SliverChildListDelegate(
              buildTextView(stepsToPrepare.split("|").length)),
        ),
      ],
    );
  }

  List buildTextView(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            new CircleAvatar(
      backgroundColor: secondaryColor,
      child: new Text((i + 1).toString(), style: new TextStyle(color: Colors.white,),),),
            new Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
              child: new Text(
                "${stepsToPrepare.split("|")[i]}", style: new TextStyle(color: textColor, fontSize: 20.0),),
            ),
          ],
        )
        )
      );
    }
    return strings;
  }
}