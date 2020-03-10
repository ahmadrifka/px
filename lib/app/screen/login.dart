import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email;
  String password;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.only(top: 10.0),
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
                  style: TextStyle(color: Colors.black38, fontSize: 17.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/picture/creativity.jpg'))),
                ),
                form(context, _globalKey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget form(context, _globalKey) {
    return Container(
      child: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              child: TextFormField(
                decoration: InputDecoration(
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red)
                  ),
                  labelText: 'Username or Email',
                ),
                validator: (val) => val.isEmpty ? 'Email or Username required' : null,
                onSaved: (value) => email = value,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              child: TextFormField(
                decoration: InputDecoration(
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(
                      color: Colors.purple
                  )),
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (val) => val.isEmpty ? 'password is required' : null,
                onSaved: (value) => password = value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                boxShadow: [
              new BoxShadow(
                color: Colors.grey[300],
                 offset: new Offset(5.0, 5.0),
                blurRadius: 20
                  ),
                ],
              ),
              child: RaisedButton(
                onPressed: () {
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.googlePlusG, color: Colors.blue,),
                    SizedBox(width: 10.0,),
                    Text('Sign In')
                  ],
                ),
            ),),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              child: RaisedButton(onPressed: () {
                if(!_globalKey.currentState.validate()){
                  return;
                }
                  Navigator.pushNamed(context, '/home');},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                color: Colors.redAccent,
                child: Text('Login',style: TextStyle(color: Colors.white,
                    fontSize: 20.0
                ),),),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

