import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends SliverPersistentHeaderDelegate {
  final double  expandedHeight;
  final double roundedRadius;
  String url;

  HomePage(this.expandedHeight, this.roundedRadius, this.url);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Image.asset(url, 
        width: MediaQuery.of(context).size.width,
        height: expandedHeight,
        fit: BoxFit.cover,
        ),
        Positioned(
          top: expandedHeight - roundedRadius - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30))
            ),
          )),
          
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}