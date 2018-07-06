import 'package:flutter/material.dart';
import '../app_state.dart';

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(children: <Widget>[
              /*Padding(
                  padding: EdgeInsets.only(top: 80.0, bottom: 20.0),
                  child: Text(
                    'Embla.',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                    width: 60.0, height: 4.0, child: Material(type: MaterialType.canvas, color: Colors.greenAccent)),*/
              Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 20.0),
                child: Text(
                  'Small scale manufacturing for everyone.',
                  style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 19.0),
                ),
              ),
              buildItemRow(context, '1', 'Upload file or find a community design'),
              buildItemRow(context, '2', 'Select from 1,000+ workshops to create your prototype'),
              buildItemRow(context, '3', 'Receive the final product')
            ])));
  }

  Widget buildItemRow(BuildContext context, String num, String desc) => Row(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 12.0, top: 5.0),
          child: Text(num,
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .copyWith(fontSize: 19.0, color: Theme.of(context).primaryColorDark))),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(top: 6.6),
              child: Text(desc,
                  style: Theme.of(context).textTheme.display1.copyWith(fontSize: 17.0)))),
    ],
    crossAxisAlignment: CrossAxisAlignment.start,
  );
}
