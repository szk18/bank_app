import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColorLight: Colors.lightBlueAccent,
  buttonColor: Colors.white,
  dividerColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

const blueGradationBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [Colors.blue, Colors.white],
    stops: const [
      0.0,
      0.9,
    ],
  ),
);
