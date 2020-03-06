import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static final String homeRouteName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageAppBar = 'assets/picture/px.jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.yellow[600],
              title: AppBar(),
              expandedHeight: 220.0,
              // floating: true,
              // backgroundColor: Colors.yellow,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  imageAppBar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
              announcmentWidget(context),
              Container(
                margin: EdgeInsets.all(20.0),
                alignment: Alignment.centerLeft,
                child: Text('TASKS', style: TextStyle(
                  fontSize: 20.0, 
                  fontWeight: FontWeight.w700
                ),),
              ),


            ]))
          ],
        ),
        bottomNavigationBar: BottomBar());
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Hi, Agent Paul', style: TextStyle(color: Colors.black),),
          Icon(Icons.notifications, color: Colors.black,),
        ],
      ),
    );
  }
}

class ContentHome extends StatefulWidget {
  @override
  _ContentHomeState createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  List<Widget> list = [

  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      onTap: _onItemTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Task')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      ],
    );
  }
}


Widget announcmentWidget (context){
  String announ = 'You\'ve been scheduled at 8 AM \n (Jakarta time) at Menara BTPN CBD \n Mega Kuningan';
  int daysCount = 10;
  return Container(
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        new BoxShadow(
          color: Colors.grey[300],
          offset: new Offset(5.0, 5.0),
          blurRadius: 20

        ),
      ]
      ),
    height: MediaQuery.of(context).size.height * 0.3,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(announ, textAlign: TextAlign.center, style: TextStyle(
          fontSize: 20.0,
        ),),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(daysCount.toString(), style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ), ),
        ),
        Text('Days To Go', style: TextStyle(
          fontSize: 17.0,
        ),)
      ],
    ),
  );
}