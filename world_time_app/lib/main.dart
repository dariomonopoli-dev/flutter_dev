import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading_screen.dart';
import 'package:world_time_app/pages/choose_location.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(MaterialApp(
    //navigation routes in the application
    initialRoute: '/',
    routes: {
      '/': (context) =>
          Home(), //context keeps track of where we are in the widget tree
      '/loading': (context) => Loading_Screen(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
