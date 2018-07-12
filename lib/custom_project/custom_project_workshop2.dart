import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../widget/star_rating.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CustomProjectWorkshop2 extends StatefulWidget {
  CustomProjectWorkshop2({Key key}) : super(key: key);

  @override
  _CustomProjectWorkshop2State createState() => new _CustomProjectWorkshop2State();
}

class _CustomProjectWorkshop2State extends State<CustomProjectWorkshop2> {
  int selectedButton = 0;
  int selectedWorkshop;
  QuerySnapshot workshopResults;

  final oCcy = new NumberFormat("#,##0.00", "en_US");

  @override
  void initState() {
    super.initState();

    Firestore.instance
        .collection('users')
        .where('has_laser_cut', isEqualTo: true)
        .orderBy('laser_cut.price_scale')
        .getDocuments()
        .then((snap) {
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
    return new MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scaffold(
            body: Padding(
              child: ListView(
                children: [
                  Padding(
                    padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 20.0, bottom: 10.0)),
                    child: Text(
                      'Select workshop.',
                      style: Theme.of(context).textTheme.title.copyWith(fontSize: 32.0),
                    ),
                  ),
                  SizedBox(width: 60.0, height: 4.0, child: Material(color: Theme.of(context).accentColor)),
                  StickyHeader(
                      header: Padding(
                          child: Material(
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
                          ])),
                          padding: EdgeInsets.only(top: 16.0, bottom: 8.0)),
                      content: Column(children: buildWorkshops()))
                ],
                padding: EdgeInsets.zero,
              ),
              padding: EdgeInsets.symmetric(horizontal: 25.0),
            ),
            floatingActionButton: selectedWorkshop == null
                ? null
                : FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.done),
                  )));
  }

  Iterable<Widget> buildWorkshops() {
    if (workshopResults == null)
      return [
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Center(child: CircularProgressIndicator())
      ];
    int i = 0;
    return workshopResults.documents.map((snap) {
      i++;
      final int q = i;
      return Card(
          margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
          elevation: 0.0,
          color: selectedWorkshop == i ? Theme.of(context).primaryColorLight : Theme.of(context).cardColor,
          child: InkWell(
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.person, size: 45.0),
                          radius: 30.0,
                          backgroundColor: Theme.of(context).primaryColorDark,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.0),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(snap['name'],
                                style: Theme.of(context).textTheme.title.copyWith(
                                    fontSize: 25.0,
                                    color: selectedWorkshop == i
                                        ? Theme.of(context).primaryColorDark
                                        : Theme.of(context).textTheme.title.color)),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            StarRating(
                              rating: (snap['seller_rating'] as num).toDouble(),
                              color: selectedWorkshop == i
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).textTheme.caption.color,
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                    ),
                    Text('Est. price: \$' + oCcy.format(snap['laser_cut']['price_scale'] * 10))
                  ])),
              onTap: () {
                setState(() {
                  selectedWorkshop = q;
                });
              }));
    }).toList();
  }
}
