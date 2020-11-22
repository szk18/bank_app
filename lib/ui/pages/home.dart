import 'package:bank_app/ui/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Container(
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
      ),
    );
  }
}
