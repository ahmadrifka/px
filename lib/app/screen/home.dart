import 'package:flutter/material.dart';
import 'package:px_project/app/screen/profile/profile_screen.dart';
import 'package:px_project/app/screen/task.dart';

class Home extends StatefulWidget {
  static final String homeRouteName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double expandedHeight = 250;
  final double roundedRadiusHeight = 30;
  String imageAppBar = 'assets/picture/px.jpeg';
  int _currentIndex = 0;

   List<Widget> _children = [
    ContentHome(),
    Task(),
    MyProfilePage()
  ];

  void onTapped(int index){
  setState(() {
    this._currentIndex = index;
  });
}

  

  @override
  Widget build(BuildContext context) {
    print(_currentIndex);
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomBar(_currentIndex, onTapped));
  }

  // Widget _buildSliverHead(){
  // return SliverPersistentHeader(
  //   delegate: HomePage(expandedHeight, roundedRadiusHeight, imageAppBar));
  // }

}




class AppBar extends StatelessWidget {
  String image;
  AppBar(this.image);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.yellow[600],
              title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Hi, James Bond', style: TextStyle(color: Colors.black, fontSize: 15.0),),
          Icon(Icons.notifications_none, color: Colors.black,),
        ],
      ),
    ),
              expandedHeight: 170.0,
              // floating: true,
              // backgroundColor: Colors.yellow,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
  );
  }
}


class ContentHome extends StatelessWidget {
  String imageAppBar = 'assets/picture/px.jpeg';

  List listData = [
    {'title': 'Preboarding - Finish your Profile', 'percent': 12.0},
    {'title': 'Onboarding Day 1 - Tasks', 'percent': 0.0},
    {'title': 'Onboarding Day 2 - Tasks', 'percent': 0.0},
    {'title': 'Onboarding Day 3 - Tasks', 'percent': 0.0},
  ];


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
          slivers: <Widget>[
            // _buildSliverHead(),
            AppBar(imageAppBar),
            SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
            //  Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30))
            //     ),
            //   ),
            announcmentWidget(context),
            taskTile(),
            // ListView.builder(
            //   itemCount: listData.length,
            //   itemBuilder: (context, index){
            //     return taskList(listData[index]);
            //   })
            taskList('Preboarding - Finish your Profile', 12, context),
            taskList('Onboarding Day 1 - Tasks', 0, context),
            taskList('Onboarding Day 2 - Tasks', 0, context),
          ],

            ),
          ),
        ],
      );
  }
}

class BottomBar extends StatefulWidget {
  int selectedIndex;
  Function onItemTap;
  BottomBar(this.selectedIndex,this.onItemTap);
  @override
  _BottomBarState createState() => _BottomBarState(selectedIndex,onItemTap);
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex;
  Function onItemTap;
  _BottomBarState(this._currentIndex,this.onItemTap);
  
  void onTapped(int index){
  setState(() {
    this._currentIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      currentIndex: _currentIndex,
      selectedItemColor: Colors.purple,
      onTap: (e) => {
        onItemTap(e),
        onTapped(e)
      },
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
          blurRadius: 15
        ),
      ]
      ),
    height: MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(announ, textAlign: TextAlign.center, style: TextStyle(
          fontSize: 15.0,
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
          fontSize: 14.0,
        ),)
      ],
    ),
  );
}

Widget taskTile (){
  return Container(
    margin: EdgeInsets.all(20.0),
    alignment: Alignment.centerLeft,
    child: Text('TASKS', style: TextStyle(
              fontSize: 20.0, 
              fontWeight: FontWeight.w700
      ),),
  );
}

Widget taskList(title, percent, context){
  double sizing = 0;
  if(percent == 12){
    sizing = 0.20;
  }
  return Container(
    padding: EdgeInsets.all(15.0),
    margin: EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        new BoxShadow(
          color: Colors.grey[300],
          offset: new Offset(5.0, 5.0),
          blurRadius: 15
        ),
      ]
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,),
            Container(
              width: MediaQuery.of(context).size.width * sizing,
              child: LinearProgressIndicator(
                value: 0.0,
              ),
            ),
            Text('$percent%')
          ],
        ),
        Icon(Icons.arrow_forward_ios, color: Colors.purple,)
      ],
    ),
  );
}