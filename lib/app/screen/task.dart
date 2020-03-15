import 'package:flutter/material.dart';

class Task extends StatelessWidget {


  List<Widget> containers = [
    Container(
      child: Center(
        child: Text('No Task',style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),),
      ),
    ),
    Container(
      child: Center(
        child: Text('No History',style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),),
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Activities', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14.0),),
          bottom: TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.purple,
            tabs: <Widget>[
              Tab(
                child: Text('Ongoing',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
              ),
              Tab(
                child: Text('History',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
              )
            ]
            ),
        ),
        body: TabBarView(
          children: containers)
      ),
    );
  }





}

