import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class HomeMainPage extends StatefulWidget {
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  @override
  Widget build(BuildContext context) {
    if ((Theme.of(context).brightness == Brightness.light) !=
        (defaultTargetPlatform == TargetPlatform.android)) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
    return ListView(
      padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 10.0)),
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: new Text(
              "Embla.",
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 32.0),
            )),
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 220.0, bottom: 20.0),
            child: Container(
                width: 20.0,
                height: 4.0,
                color: Theme.of(context).primaryColor,
                constraints: BoxConstraints.tightFor(width: 25.0, height: 4.0))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Row(children: [
              Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                elevation: 6.0,
                child: Text('Start a new project'),
                color: Theme.of(context).accentColor,
                colorBrightness: Brightness.dark,
                onPressed: () {},
              ))
            ])),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Text(
              'Community Designs',
              style: Theme.of(context).textTheme.display1,
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: TextField(
              style: Theme.of(context).textTheme.body1,

              decoration: InputDecoration(filled: true, fillColor: Colors.grey.shade200,
                  icon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: EdgeInsets.all(8.0), hintText: 'Search designs...'),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Text(
              'Trending Designs',
              style: Theme.of(context).textTheme.display1,
            )),
      ],
    );
  }
}
