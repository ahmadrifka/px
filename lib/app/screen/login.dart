import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome Aboard!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Welcome all Talents, enjoy your adventure here in Digital Katalis',
                  style: TextStyle(color: Colors.black38, fontSize: 20.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.freepik.com/free-vector/creativity-concept-illustration_114360-1083.jpg'))),
                ),
                form(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget form(context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(
                  color: Colors.purple
                )),
            labelText: 'Username',
            
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(
                  color: Colors.purple
                )),
            labelText: 'Password',
            
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: RaisedButton(onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
          color: Colors.pink,
          child: Text('Login',style: TextStyle(color: Colors.white),),),
        )
      ],
    ),
  );
}
