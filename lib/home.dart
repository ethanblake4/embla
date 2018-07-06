import 'package:flutter/material.dart';
import 'home_main.dart';
import 'orders.dart';
import 'account.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class NavigationIconView {
  NavigationIconView({
    Widget view,
    Widget icon,
    Widget title,
    Color color,
    TickerProvider vsync,
  })
      : _icon = view,
        _color = color,
        item = new BottomNavigationBarItem(
          icon: icon,
          title: title,
          backgroundColor: color,
        ),
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final Color _color;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light ? themeData.primaryColor : themeData.accentColor;
    }

    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.02), // Slightly down.
          end: Offset.zero,
        )
            .animate(_animation),
        child: new IconTheme(
          data: new IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: _icon,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;

  Scaffold bodyScaffold;

  @override
  void initState() {
    super.initState();

    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        view: new HomeMainPage(),
        icon: const Icon(Icons.home),
        title: const Text('Home'),
        color: Colors.white,
        vsync: this,
      ),
      new NavigationIconView(
        view: OrdersPage(),
        icon: const Icon(Icons.list),
        title: const Text('Orders'),
        color: Colors.white,
        vsync: this,
      ),

      new NavigationIconView(
        view: AccountPage(),
        icon: const Icon(Icons.person),
        title: const Text('Account'),
        color: Colors.white,
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews) view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews)
      transitions.add(view.transition(BottomNavigationBarType.fixed, context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    final List<Widget> widgets = transitions;

    return new Stack(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView navigationView) => navigationView.item).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    bodyScaffold = new Scaffold(
      /*appBar: new AppBar(
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        elevation: 0.0,
        brightness: Navigator.of(context).canPop() ? Brightness.light : Brightness.light,
        backgroundColor: Colors.white,
        title: new Text(
          "Embla.",
          style: Theme.of(context).textTheme.title.copyWith(fontSize: 25.0),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () {

            },
          )
        ],
      ),*/
      body: Stack(children: [
        _buildTransitionsStack(),
        Container(
            width: double.infinity, 
            height: 20.0,
            color: Theme.of(context).canvasColor.withAlpha(180))
      ]),
      bottomNavigationBar: botNavBar
    );

    return new Column(children: <Widget>[
          new Expanded(child: bodyScaffold),
          new Container(
            height: 0.0,
            color: Colors.white,
          )
        ]);
  }
}
