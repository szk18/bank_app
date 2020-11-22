import 'package:bank_app/common/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: blueGradationBoxDecoration,
      child: Center(
        child: Text('home page.'),
      ),
    );
  }
}
