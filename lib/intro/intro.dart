import 'package:flutter/material.dart';
import 'page1.dart';
import 'login.dart';
import 'page4.dart';
import 'buyer_or_seller.dart';
import '../widget/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Intro extends StatefulWidget {
  Intro({Key key}) : super(key: key);

  @override
  _IntroState createState() => new _IntroState();
}

class _IntroState extends State<Intro> {
  final _controller = new PageController();
  List<Widget> _pages;
  int pageNum = 2;
  int page = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      Page1(),
      LoginPage(
        loginComplete: () {
          setState(() {
            pageNum = 3;
            _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
          });
        },
      ),
      BuyerOrSeller(nextPage: () {
        setState(() {
          pageNum = 4;
        });
        _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      }),
      Page4()
    ];
  }

  @override
  Widget build(BuildContext context) {
    if ((Theme.of(context).brightness == Brightness.light) !=
        (defaultTargetPlatform == TargetPlatform.android)) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned.fill(
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 80.0, bottom: 20.0, left: 50.0, right: 50.0),
            child: Text(
              'Embla.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: SizedBox(width: 60.0, height: 4.0, child: Material(color: Theme.of(context).primaryColor))),
          Expanded(
              child: PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemCount: pageNum,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
            onPageChanged: (int p) {
              setState(() {
                page = p;
              });
            },
          )),
        ])),
        Positioned(
          bottom: 10.0,
          left: 0.0,
          right: 0.0,
          child: new SafeArea(
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new DotsIndicator(
                color: /*Theme.of(context).brightness == Brightness.light ? Colors.black : */Theme.of(context).accentColor,
                controller: _controller,
                itemCount: 4,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
