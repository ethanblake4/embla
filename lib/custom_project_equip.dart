import 'package:flutter/material.dart';

class CustomProjectEquip extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 10.0)), children: <Widget>[
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: new Text(
            "Select equipment.",
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 22.0),
          )),
      Padding(
          padding: EdgeInsets.only(left: 25.0, right: 220.0, bottom: 20.0),
          child: Container(
              width: 20.0,
              height: 4.0,
              color: Theme.of(context).primaryColor,
              constraints: BoxConstraints.tightFor(width: 25.0, height: 4.0)))
    ]);
  }
}