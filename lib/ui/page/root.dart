import 'package:bank_app/model/navigation_model.dart';
import 'package:bank_app/ui/page/detail_page.dart';
import 'package:bank_app/ui/page/graph_page.dart';
import 'package:bank_app/ui/page/home_page.dart';
import 'package:bank_app/ui/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  final _pageList = [HomePage(), DetailPage(), GraphPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('*****-****0000'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: _pageList[context.watch<NavigationModel>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) => context.read<NavigationModel>().update(index),
          currentIndex: context.watch<NavigationModel>().currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined), label: '現在高'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined), label: '明細'),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined), label: 'グラフ'),
          ]),
    );
  }
}
