import 'package:bank_app/config/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: blueGradationBoxDecoration,
      child: Center(
        child: InfoCard(),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      margin: const EdgeInsets.fromLTRB(40, 160, 40, 60),
      elevation: 2,
      shadowColor: Theme.of(context).accentColor,
      child: Column(
        children: [
          const FlutterLogo(
            size: 80,
          ),
          CurrentBalanceText(),
          Container(
            child: const Text(
              '\\ 999999',
              style: TextStyle(fontSize: 40, color: Colors.blue),
            ),
          ),
          const Text(
            '※これはクローンアプリです。',
            style: TextStyle(fontSize: 10),
          ),
          const Divider(),
          UserInfo(),
        ],
      ),
    );
  }
}

class CurrentBalanceText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.monetization_on_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          const Text(
            '現在高',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text('記号・番号'), Text('種別')],
      ),
    );
  }
}
