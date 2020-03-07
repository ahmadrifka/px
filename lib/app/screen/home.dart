import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static final String homeRouteName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.notifications), onPressed: (){}),
            expandedHeight: 220.0,
            floating: true,
            // backgroundColor: Colors.yellow,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/picture/px.jpeg', fit: BoxFit.fill,),
            ),
          )
        ],
      ),
    );
  }
}