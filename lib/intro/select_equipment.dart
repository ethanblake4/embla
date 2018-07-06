import 'package:flutter/material.dart';
import 'package:embla/equipment_search.dart';

class SelectEquipment extends StatefulWidget {
  _SelectEquipmentState createState() => _SelectEquipmentState();
}

class _SelectEquipmentState extends State<SelectEquipment> {
  List<String> equipment = [];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80.0, bottom: 20.0),
                child: Text(
                  'Embla.',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              SizedBox(width: 60.0, height: 4.0, child: Material(type: MaterialType.canvas, color: Colors.greenAccent)),
              Padding(
                padding: EdgeInsets.only(top: 34.0),
                child: Text(
                  'Add equipment you wish to make available to the Embla community.',
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              ListView.builder(
                itemBuilder: (context, i) => Text(equipment[i]),
                itemCount: equipment.length,
                shrinkWrap: true,
              ),
              Padding(padding: EdgeInsets.only(bottom: 16.0)),
              Flex(direction: Axis.horizontal, children: [
                Expanded(
                    child: RaisedButton(
                        colorBrightness: Theme.of(context).primaryColorBrightness,
                        onPressed: () {
                          showDialog(context: context, builder: (BuildContext context) => EquipmentSearch())
                              .then((value) {
                            if (value is String) equipment.add(value);
                          });
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0), child: Text('Add one'))))
              ])
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Icon(Icons.done, color: Colors.white,)),
    );
  }
}
