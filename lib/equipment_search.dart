import 'package:flutter/material.dart';

class EquipmentSearch extends StatelessWidget {

  final TextEditingController controller = TextEditingController();

  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.all(20.0),
        content: Column(
          children: <Widget>[
            Text('Add equipment', style: Theme.of(context).textTheme.display1),
            Padding(padding: EdgeInsets.only(bottom: 6.0)),
            TextField(
              controller: controller,
              autocorrect: false,
              style: Theme.of(context).textTheme.body1,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Enter search term', icon: Icon(Icons.search)),
            )
          ],
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
    actions: <Widget>[
      SimpleDialogOption(
        onPressed: () {
          Navigator.of(context).pop(controller.text);
        },
        child: Text('OK', style: Theme.of(context).textTheme.button,)
      )
    ],);
  }
}
