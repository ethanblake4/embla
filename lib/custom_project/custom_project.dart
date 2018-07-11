import 'package:flutter/material.dart';
import 'package:embla/custom_project/custom_project_equip.dart';
import 'package:embla/custom_project/custom_project_upload.dart';
import 'package:embla/custom_project/custom_project_workshop.dart';
import 'package:embla/custom_project/custom_project_order.dart';
import '../widget/dots_indicator.dart';

class CustomProject extends StatefulWidget {
  CustomProject({Key key}) : super(key: key);

  @override
  _CustomProjectState createState() => new _CustomProjectState();
}

class _CustomProjectState extends State<CustomProject> {
  final _controller = new PageController();
  List<Widget> _pages;
  int pageNum = 4;
  int page = 0;

  @override
  void initState() {
    super.initState();

    _pages = [CustomProjectEquip(onNext: (){
      nextScreen();
    }), CustomProjectUpload(onNext: () {
      nextScreen();
    }), CustomProjectWorkshop(onNext: () {
      nextScreen();
    }), CustomProjectOrder(onNext: () {
      Navigator.of(context).pop();
    })];
  }

  void nextScreen() {
    _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding:
                  MediaQuery.of(context).padding.add(EdgeInsets.only(top: 20.0, bottom: 10.0, left: 25.0, right: 25.0)),
              child: Text(
                'Start a new Project.',
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 26.0),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 50.0),
                child: SizedBox(width: 60.0, height: 4.0, child: Material(color: Theme.of(context).accentColor))),
            Expanded(
                child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
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
            Padding(child: DotsIndicator(controller: _controller, itemCount: 4),
            padding: EdgeInsets.only(bottom: 30.0),)
          ])),
        ],
      ),
      elevation: 0.0,
    );
  }
}
