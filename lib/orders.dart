import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 10.0)),
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: new Text(
              "Orders.",
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 32.0),
            )),
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 220.0, bottom: 20.0),
            child: Container(
                width: 20.0,
                height: 4.0,
                color: Theme.of(context).accentColor,
                constraints: BoxConstraints.tightFor(width: 25.0, height: 4.0))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'In Progress (2)',
              style: Theme.of(context).textTheme.display1,
            )),
        Container(
          height: 98.0,
          child: ListView(
            padding: EdgeInsets.only(bottom: 12.0, top: 6.0, left: 25.0, right: 25.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              buildOrderCard(context, 'A thing', 'Step 2/3', Icons.border_all),
              buildOrderCard(context, 'Music thing', 'Step 1/2', Icons.headset)
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 14.0),
        ),
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 8.0),
            child: Text(
              'Order History (6)',
              style: Theme.of(context).textTheme.display1,
            )),
        buildOrderTile(context, Icons.ac_unit, 'A cold thing'),
        buildOrderTile(context, Icons.brightness_high, 'A hot thing'),
        buildOrderTile(context, Icons.extension, 'A puzzling thing'),
        buildOrderTile(context, Icons.gavel, 'A legal thing'),
        buildOrderTile(context, Icons.poll, 'A statistical thing')
      ],
    );
  }

  Widget buildOrderCard(BuildContext context, String title, String step, IconData icon) {
    return Card(
        elevation: 8.0,
        child: InkWell(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 22.0),
              child: Row(children: [
                Icon(
                  icon,
                  size: 38.0,
                  color: Theme.of(context).iconTheme.color,
                ),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Text(title, style: Theme.of(context).textTheme.button),
                    Padding(padding: EdgeInsets.only(top: 6.0)),
                    Text(step, style: Theme.of(context).textTheme.caption)
                  ],
                )
              ])),
          onTap: () {},
        ));
  }

  Widget buildOrderTile(BuildContext context, IconData icon, String title) {
    return InkWell(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 42.0,
                  color: Theme.of(context).iconTheme.color,
                ),
                Padding(padding: EdgeInsets.only(left: 24.0)),
                Column(children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 2.0)),
                  Text('Delivered 6/17', style: Theme.of(context).textTheme.caption)
                ], crossAxisAlignment: CrossAxisAlignment.start)
              ],
            )),
        onTap: () {});
  }
}
