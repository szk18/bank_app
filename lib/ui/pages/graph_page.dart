import 'package:bank_app/common/theme.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      constraints: const BoxConstraints.expand(),
      child: const Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        color: Colors.white,
        margin: EdgeInsets.zero,
        elevation: 0,
        child: FlutterLogo(),
      ),
    );
  }
}
