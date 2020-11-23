import 'package:bank_app/common/theme.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: blueGradationBoxDecoration,
      child: const Center(
        child: Icon(Icons.insert_chart_outlined),
      ),
    );
  }
}
