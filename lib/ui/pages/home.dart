import 'package:bank_app/ui/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Container(
        child: Center(child: Text('home page.')),
      ),
    );
  }
}
