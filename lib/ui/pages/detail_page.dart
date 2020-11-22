import 'package:bank_app/common/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: blueGradationBoxDecoration,
      child: Center(
        child: Icon(
          Icons.receipt_long_outlined,
        ),
      ),
    );
  }
}
