import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome Aboard !',
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
                  'Welcome to all talents, enjoy your adventure here in Digital Katalis',
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
                form(context, _globalKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget form(context, _globalKey) {
  return Container(
    key: _globalKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextFormField(

          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red)
                ),
            labelText: 'Username or Email',
          ),
          validator: (val) => val.isEmpty ? 'Email or Username required' : null,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(
                  color: Colors.purple
                )),
            labelText: 'Password',
          ),
          obscureText: true,
          validator: (val) => val.isEmpty ? 'password is required' : null,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          child: RaisedButton(onPressed: () => Navigator.pushNamed(context, '/home'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
            color: Colors.redAccent,
            child: Text('Login',style: TextStyle(color: Colors.white,
            fontSize: 20.0
            ),),),
        )
      ],
    ),
  );
}
