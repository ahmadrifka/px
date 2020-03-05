
import 'package:flutter/material.dart';
import 'package:px_project/app/screen/home.dart';
import 'package:px_project/app/screen/login.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/' : (context) => LoginPage(),
    '/home' : (context) => Home(),
  },

));



