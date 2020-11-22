import 'package:bank_app/models/navigation_model.dart';
import 'package:bank_app/ui/pages/detail_page.dart';
import 'package:bank_app/ui/pages/graph_page.dart';
import 'package:bank_app/ui/pages/home_page.dart';
import 'package:bank_app/ui/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  final _pageList = [HomePage(), DetailPage(), GraphPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: _pageList[context.watch<NavigationModel>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) => context.read<NavigationModel>().update(index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined), label: ''),
          ]),
    );
  }
}
