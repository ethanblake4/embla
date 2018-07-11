import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'app_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'community_item.dart';
import 'widget/star_rating.dart';


class AccountPage extends StatefulWidget {
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<String> imageNetworkUrls = List();

  @override
  void initState() {
    super.initState();
    var app = AppState();
    if (new DateTime.now().millisecondsSinceEpoch > app.accountDocLastUpdate + 40 * 1000 || app.forceAccountDocUpdate) {
      Firestore.instance.collection('users').document('ethanblake@gmail.com').get().then((doc) {
        print('updated account from firestore');
        setState(() {
          app.accountDocLastUpdate = new DateTime.now().millisecondsSinceEpoch;
          app.accountDoc = doc;
          app.forceAccountDocUpdate = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          var app = AppState();
          var doc = await Firestore.instance.collection('users').document('ethanblake@gmail.com').get();
          print('updated account from firestore');
          setState(() {
            app.accountDocLastUpdate = new DateTime.now().millisecondsSinceEpoch;
            app.accountDoc = doc;
            app.forceAccountDocUpdate = false;
          });
        },
        child: ListView(
            padding: MediaQuery.of(context).padding.add(EdgeInsets.only(top: 10.0)),
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: new Text(
                    "Account.",
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 32.0),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 220.0, bottom: 20.0),
                  child: Container(
                      width: 20.0,
                      height: 4.0,
                      color: Theme.of(context).accentColor,
                      constraints: BoxConstraints.tightFor(width: 25.0, height: 4.0))),
              Center(child: Icon(Icons.person)),
              Center(child: Text(AppState().currentUser.displayName, style: Theme.of(context).textTheme.display1)),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Center(
                  child: Text("I like to drink tea sometimes, sometimes not.",
                      style: Theme.of(context).textTheme.caption)),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 25.0, bottom: 12.0),
                child: Text(
                  "My Community Items " +
                      (AppState().accountDoc == null
                          ? ""
                          : "(" + (AppState().accountDoc.data['items'] as List).length.toString() + ")"),
                  style: Theme.of(context).textTheme.display1.copyWith(fontSize: 18.0),
                ),
              ),
            ]..addAll(mapItems())));
  }

  Iterable<Widget> mapItems() {
    DocumentSnapshot acc = AppState().accountDoc;

    if (acc == null) return [];
    return (acc.data['items'] as List).take(5).map((it) {
      return Card(
          elevation: 6.0,
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: InkWell(
            child: Row(children: [
              SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: Hero(
                    child: CachedNetworkImage(
                      imageUrl: it['image'],
                    ),
                    tag: it['image'],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(it['title'], style: Theme.of(context).textTheme.display1.copyWith(fontSize: 16.0)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                  ),
                  StarRating(
                    rating: 4.5,
                    color: Theme.of(context).textTheme.display1.color,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                  ),
                  Text(it['downloads'].toString() + " prints", style: Theme.of(context).textTheme.caption),
                ],
              )
            ]),
            onTap: () {
              Navigator
                  .of(context)
                  .push(new MaterialPageRoute(builder: (ctx) => CommunityItemPage(item: it)));
            },
          ));
    });
  }
}
