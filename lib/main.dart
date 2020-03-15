

import 'package:flutter/material.dart';
import 'package:px_project/app/screen/home.dart';
import 'package:px_project/app/screen/login.dart';
import 'package:px_project/app/screen/profile/profile_screen.dart';
import 'package:px_project/app/screen/task.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/' : (context) => LoginPage(),
    '/home' : (context) => Home(),
    '/profile' : (context) => MyProfilePage(),
    '/task' : (context) => Task()
  },

));



