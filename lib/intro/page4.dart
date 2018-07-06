import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(
              children: <Widget>[
                /*Padding(
                  padding: EdgeInsets.only(top: 80.0, bottom: 20.0),
                  child: Text(
                    'Embla.',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                    width: 60.0, height: 4.0, child: Material(type: MaterialType.canvas, color: Colors.greenAccent)),*/
                Padding(padding: EdgeInsets.only(top: 34.0)),
                Text('All set!', style: Theme.of(context).textTheme.subhead,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      colorBrightness: Theme.of(context).primaryColorBrightness,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                          child: Text('Start creating')
                      )
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )));
  }
}
