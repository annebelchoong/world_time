import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  //For testing purposes, we gonna override and make the home screen the first screen to load instead of the loading screen
  initialRoute: '/',
  routes: {
    //base route first(/)
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context)=>ChooseLocation(),
  },
));


