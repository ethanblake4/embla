import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CustomProjectEquip2 extends StatefulWidget {
  CustomProjectEquip2({Key key}) : super(key: key);

  @override
  _CustomProjectEquip2State createState() => new _CustomProjectEquip2State();
}

class _CustomProjectEquip2State extends State<CustomProjectEquip2> {
  int selectedButton;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((Theme.of(context).brightness == Brightness.light) != (defaultTargetPlatform == TargetPlatform.android)) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
    return new Scaffold(
        body: Padding(
      child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 20.0, bottom: 10.0)),
          child: Text(
            'Select tool.',
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 32.0),
          ),
        ),
        SizedBox(width: 60.0, height: 4.0, child: Material(color: Theme.of(context).accentColor)),
        Padding(
            child: Row(children: [
              Expanded(
                  child: FlatButton(
                onPressed: () {
                  setState(() {
                    selectedButton = 0;
                  });
                },
                child: Text("3D Printing",
                    style: Theme.of(context).textTheme.button.copyWith(
                        fontSize: 18.0,
                        color: selectedButton == 0
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).textTheme.button.color)),
                color: selectedButton == 0 ? Theme.of(context).primaryColorLight : Colors.grey.shade300,
                padding: EdgeInsets.symmetric(vertical: 15.0),
              )),
            ]),
            padding: EdgeInsets.only(top: 32.0, bottom: 8.0)),
        Padding(
            child: Row(children: [
              Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                      });
                    },
                    child: Text("CNC Milling",
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 18.0,
                            color: selectedButton == 1
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).textTheme.button.color)),
                    color: selectedButton == 1 ? Theme.of(context).primaryColorLight : Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  )),
            ]),
            padding: EdgeInsets.symmetric(vertical: 8.0)),
        Padding(
            child: Row(children: [
              Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 2;
                      });
                    },
                    child: Text("Injection Molding",
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 18.0,
                            color: selectedButton == 2
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).textTheme.button.color)),
                    color: selectedButton == 2 ? Theme.of(context).primaryColorLight : Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  )),
            ]),
            padding: EdgeInsets.symmetric(vertical: 8.0)),
        Padding(
            child: Row(children: [
              Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 3;
                      });
                    },
                    child: Text("Laser Cutting",
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 18.0,
                            color: selectedButton == 3
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).textTheme.button.color)),
                    color: selectedButton == 3 ? Theme.of(context).primaryColorLight : Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  )),
            ]),
            padding: EdgeInsets.symmetric(vertical: 8.0)),
        Padding(
            child: Row(children: [
              Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 4;
                      });
                    },
                    child: Text("Laser Engraving",
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 18.0,
                            color: selectedButton == 4
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).textTheme.button.color)),
                    color: selectedButton == 4 ? Theme.of(context).primaryColorLight : Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  )),
            ]),
            padding: EdgeInsets.symmetric(vertical: 8.0)),
      ]),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
    ), floatingActionButton: selectedButton == null ? null : FloatingActionButton(onPressed: () {
      Navigator.of(context).pop();
    }, child: Icon(Icons.done),));
  }
}
