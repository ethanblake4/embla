import 'package:flutter/material.dart';
import 'custom_project_equip.dart';

class CustomProject extends StatefulWidget {
  CustomProject({Key key}) : super(key: key);

  @override
  _CustomProjectState createState() => new _CustomProjectState();
}

class _CustomProjectState extends State<CustomProject> {
  final _controller = new PageController();
  List<Widget> _pages;
  int pageNum = 2;
  int page = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      CustomProjectEquip()
    ];
  }

  @override
  Widget build(BuildContext context) {
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
                ])),
          ],
        ));
  }
}
