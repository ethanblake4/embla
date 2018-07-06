import 'package:flutter/material.dart';
import 'select_equipment.dart';

class BuyerOrSeller extends StatelessWidget {

  const BuyerOrSeller({ this.nextPage });

  final VoidCallback nextPage;

  Widget build(BuildContext context) {
    return SafeArea(
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
              SizedBox(width: 60.0, height: 4.0, child: Material(type: MaterialType.canvas, color: Colors.greenAccent)),*/
              Padding(padding: EdgeInsets.only(top: 34.0)),
              Text(
                'Are you planning to sell manufacturing services? Or only buy?',
                style: Theme.of(context).textTheme.body1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    colorBrightness: Theme.of(context).primaryColorBrightness,
                    onPressed: () {
                      nextPage();
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                        child: Text('Buy only')
                    )
                ),
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  colorBrightness: Theme.of(context).primaryColorBrightness,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/select_equipment').then((result) {
                      if(result == true) nextPage();
                    });
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                      child: Text('Buy and sell')
                  )
              )
            ], crossAxisAlignment: CrossAxisAlignment.start)));
  }
}
