import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  final String title = 'My Profile';
  Color colorsWhite = Colors.white;

  List<Widget> listIcon = [
    Icon(Icons.home, color: Colors.white,),
    Icon(Icons.image, color: Colors.white,),
    Icon(Icons.portrait, color: Colors.white,),
    Icon(Icons.poll, color: Colors.white,),
    Icon(Icons.play_circle_outline, color: Colors.white,),
    Icon(Icons.pin_drop, color: Colors.white,),
    Icon(Icons.save_alt, color: Colors.white,),
    Icon(Icons.schedule, color: Colors.white,),
    Icon(Icons.library_music, color: Colors.white,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.help),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.notifications_none)
          ], 
        )),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: 10,
        ),
      ),
      // bottomSheet: Container(
      //   height: 50,
      //   width: MediaQuery.of(context).size.width,
      //   color: Colors.white,
      //   child: Center(
      //       child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       Icon(
      //         Icons.home,
      //         color: Colors.black,
      //       ),
      //       Icon(
      //         Icons.list,
      //         color: Colors.black,
      //       ),
      //       Icon(
      //         Icons.person,
      //         color: Colors.purple,
      //       )
      //     ],
      //   )),
      // ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffededed),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 420,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, -70),
                      blurRadius: 100,
                    )
                  ],
                ),
                child: ClipPath(
                  clipper: ContainerClipper(),
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            height: 15,
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: Color(0xffededed),
                                            ),
                                          ),
                                          Text(
                                            '0%',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 25.0),
                                    child: Text(
                                      'Hi, James Bond Finish your bio progress !!',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    height: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        'assets/picture/no-pp.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      'Add Your Picture',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:200.0),
                          child: SafeArea(
                            child: Container(
                              height: 240,
                              child: Transform(
                                alignment: FractionalOffset.center,
                                  transform: Matrix4.identity()..rotateX(3.14),
                                  child: CircleListScrollView(
                                  physics: CircleFixedExtentScrollPhysics(),
                                  axis: Axis.horizontal,
                                  itemExtent: 60,
                                  children: List.generate(listIcon.length, _buildItem),
                                  radius: MediaQuery.of(context).size.width * 0.6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
             Text(
               'Show My QR',
               style: TextStyle(
                   color: Colors.purple,
                   fontSize: 12,
                   fontWeight: FontWeight.w600),
             ),
            ],
          )),
    );
  }

  Widget _buildItem(int i) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Transform(
          alignment: FractionalOffset.center,
          transform: new Matrix4.identity()..rotateX(3.14),
            child: Container(
            height: 40,
            width: 40,
            color: Colors.purple,
            child: Center(
              child: listIcon[i]
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
