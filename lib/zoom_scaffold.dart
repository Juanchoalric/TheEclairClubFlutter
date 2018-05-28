import 'package:flutter/material.dart';
import 'package:the_eclair_club/menu_screen.dart';

class ZoomScatffold extends StatefulWidget {
  final Widget menuScreen;
  final Screen contentScreen;

  ZoomScatffold({
    this.contentScreen,
    this.menuScreen,
  });

  @override
  _ZoomScatffoldState createState() => new _ZoomScatffoldState();
}

class _ZoomScatffoldState extends State<ZoomScatffold> with TickerProviderStateMixin{

  MenuController menuController;

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  createContentDisplay() {
    return zoomAndSlideContent(
        Container(
      decoration: new BoxDecoration(
        image: widget.contentScreen.background,
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          title: new Text(
            widget.contentScreen.title,
            style: new TextStyle(
              fontFamily: 'Shadows Into Light',
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: new IconButton(icon: new Icon(
              Icons.menu),
              onPressed: () {
                menuController.toggle();
              }),
          elevation: 0.0,
        ),
        body: widget.contentScreen.contentBuilder(context),
      ),
    ));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;
    switch (menuController.state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius = 10.0 * menuController.percentOpen;

    return new Transform(
        transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
          ..scale(contentScale, contentScale),
        alignment: Alignment.centerLeft,
        child: new Container(
          decoration: new BoxDecoration(boxShadow: [
            new BoxShadow(
              color: const Color(0x44000000),
              offset: const Offset(0.0, 5.0),
              blurRadius: 20.0,
              spreadRadius: 10.0,
            )
          ],
          ),
          child: new ClipRRect(
              borderRadius: new BorderRadius.circular(cornerRadius),
              child: content
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        widget.menuScreen,
        createContentDisplay(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }
}

class ZoomScaffodMenuController extends StatelessWidget {

  final ZoomScaffoldBuild builder;

  ZoomScaffodMenuController({
    this.builder,
  });

  getMenuController(BuildContext context){
    final scaffoldState = context.ancestorStateOfType(
        new TypeMatcher<_ZoomScatffoldState>()

        ) as _ZoomScatffoldState;
    return scaffoldState.menuController;
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, getMenuController(context));
  }
}

typedef Widget ZoomScaffoldBuild(
    BuildContext context,
    MenuController menuController
    );



class Screen {
  final String title;
  final DecorationImage background;
  final WidgetBuilder contentBuilder;

  Screen({
    this.title,
    this.background,
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier{
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
}) : _animationController = new AnimationController(vsync: vsync){
    _animationController
    ..duration = const Duration(milliseconds: 250)
        ..addListener(() {
          notifyListeners();
        })
        ..addStatusListener((AnimationStatus status) {
          switch (status) {
            case AnimationStatus.forward:
              state = MenuState.opening;
              break;
            case AnimationStatus.reverse:
              state = MenuState.closing;
              break;
            case AnimationStatus.completed:
              state = MenuState.open;
              break;
            case AnimationStatus.dismissed:
              state = MenuState.closed;
              break;
          }
          notifyListeners();
        });
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open(){
    _animationController.forward();
  }

  close(){
    _animationController.reverse();
  }

  toggle(){
    if(state == MenuState.open){
      close();
    } else if (state == MenuState.closed){
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}