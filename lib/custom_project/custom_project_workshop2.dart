import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CustomProjectWorkshop2 extends StatefulWidget {
  CustomProjectWorkshop2({Key key}) : super(key: key);

  @override
  _CustomProjectWorkshop2State createState() => new _CustomProjectWorkshop2State();
}

class _CustomProjectWorkshop2State extends State<CustomProjectWorkshop2> {
  int selectedButton;
  int selectedWorkshop;
  QuerySnapshot workshopResults;

  @override
  void initState() {
    super.initState();

    Firestore.instance.collection('users').where('has_laser_cut', isEqualTo: true)
        .orderBy('laser_cut.price_scale').getDocuments().then((snap) {
          setState(() {
            workshopResults = snap;
          });
    });
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
          child: ListView(children: [
            Padding(
              padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 20.0, bottom: 10.0)),
              child: Text(
                'Select workshop.',
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 32.0),
              ),
            ),
            SizedBox(width: 60.0, height: 4.0, child: Material(color: Theme.of(context).accentColor)),
            Padding(
                child: Row(children: [
                  Text(
                    "SORT",
                    style: Theme.of(context).textTheme.button,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 0;
                      });
                    },
                    child: Text("Price",
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 15.0,
                            color: selectedButton == 0
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).textTheme.button.color)),
                    color: selectedButton == 0 ? Theme.of(context).primaryColorLight : Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                      });
                    },
                    child: Text("Time",
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 15.0,
                            color: selectedButton == 1
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).textTheme.button.color)),
                    color: selectedButton == 1 ? Theme.of(context).primaryColorLight : Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                  )
                ]),
                padding: EdgeInsets.only(top: 16.0, bottom: 8.0)),
          ]..addAll(buildWorkshops())),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
        ),
        floatingActionButton: selectedButton == null
            ? null
            : FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.done),
              ));
  }

  Iterable<Widget> buildWorkshops() {
    if(workshopResults == null) return [];
    return workshopResults.documents.map((snap) => Card(child: Text(snap['name']),));
  }
}
