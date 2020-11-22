import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [Colors.blue, Colors.white],
        stops: const [
          0.0,
          0.9,
        ],
      )),
      child: Center(child: Text('home page.')),
    );
  }
}
