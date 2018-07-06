import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_parallax/flutter_parallax.dart';

class CommunityItemPage extends StatelessWidget {

  CommunityItemPage({this.image});

  final String image;

  Widget build(BuildContext ctz) {
    return Scaffold(
      body: ListView(children: [Parallax.inside(child: Hero(
        tag: image,
        child: CachedNetworkImage(imageUrl: image)), mainAxisExtent: 200.0, direction: AxisDirection.down,)
      ])
    );
  }
}