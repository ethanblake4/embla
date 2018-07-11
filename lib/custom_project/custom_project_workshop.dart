import 'package:flutter/material.dart';
import 'custom_project_workshop2.dart';

class CustomProjectWorkshop extends StatelessWidget {

  CustomProjectWorkshop({this.onNext});

  final VoidCallback onNext;

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        //padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 10.0, bottom: 20.0)),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: FlatButton(
                child: Text(
                  "Select Workshop",
                  style: Theme.of(context).textTheme.title.copyWith(fontSize: 22.0,
                      color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CustomProjectWorkshop2())).then((x) {
                    onNext();
                  });
                },
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                color: Theme.of(context).primaryColor.withAlpha(40),
              )),
          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 30.0),
              child: Text(

                "Select a workshop of your choice, whether it be faster, cheaper, or closer.",
                style: Theme.of(context).textTheme.caption.copyWith(fontSize: 18.0,),
                textAlign: TextAlign.center,
              )),
        ],
      ),
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
      ),
    );
  }
}
