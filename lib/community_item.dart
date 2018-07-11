import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'widget/parallax_cached_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityItemPage extends StatefulWidget {
  CommunityItemPage({this.item});

  final Map<dynamic, dynamic> item;

  _CommunityItemPageState createState() => _CommunityItemPageState();
}

class _CommunityItemPageState extends State<CommunityItemPage> {

  final ScrollController control = ScrollController();
  final ScrollController boxes = ScrollController();
  DocumentSnapshot itemSnap;
  double pos = 0.0;

  void initState() {
    super.initState();

    (widget.item['item_ref'] as DocumentReference).get().then((doc) {
      setState(() {
        itemSnap = doc;
      });
    });

    control.addListener(() {
      setState(() {
        pos = control.position.extentBefore;
      });
    });

  }

  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
      children: <Widget>[
        ParallaxCachedImage(controller: control, imageUrl: widget.item['image']),
        ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width)),
            Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                      child: Text(
                        widget.item['title'],
                        style: Theme.of(context).textTheme.display1,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: AnimatedCrossFade(
                        firstChild: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        secondChild: itemSnap == null
                            ? Container()
                            : Text(
                                itemSnap.data['desc'],
                                style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 14.0
                                ),
                              ),
                        crossFadeState: itemSnap == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300),
                        sizeCurve: Curves.fastOutSlowIn),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100.0),
                  )
                ],
              ),
              elevation: 0.0,
            )
          ],
          controller: control,
          physics: AlwaysScrollableScrollPhysics(),

        ),
        Positioned(child: SizedBox(child: FlatButton(
            onPressed: () {}, 
            child: Text("AR"), 
            color: Colors.white,
          colorBrightness: Brightness.light,
        ), width: 63.0,),
        right: 12.0, top: MediaQuery.of(context).size.width - 50.0),
        SizedBox(child: AppBar(backgroundColor: Colors.transparent, elevation: 0.0,),
        height: 80.0)
      ],
    ), floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.build),),);
  }
}
