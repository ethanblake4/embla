import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommunityItemPage extends StatelessWidget {

  CommunityItemPage({this.image});

  String image;

  Widget build(BuildContext ctz) {
    return Scaffold(
      body: Hero(
        tag: image,
        child: CachedNetworkImage(imageUrl: image),
      ),
    );
  }
}