import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ParallaxCachedImage extends StatefulWidget {

  ParallaxCachedImage({this.controller, this.imageUrl});

  _ParallaxCachedImageState createState() => _ParallaxCachedImageState();

  final ScrollController controller;
  final String imageUrl;

}

class _ParallaxCachedImageState extends State<ParallaxCachedImage> {

  double pos = 0.0;

  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        pos = widget.controller.position.extentBefore;
      });
    });
  }

  Widget build(BuildContext context) {
    return Positioned(
      child: Hero(
        tag: widget.imageUrl,
        child: CachedNetworkImage(imageUrl: widget.imageUrl),
      ),
      top: -pos * 0.3, width: MediaQuery.of(context).size.width
    );
  }
}