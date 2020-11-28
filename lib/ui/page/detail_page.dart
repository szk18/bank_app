import 'package:bank_app/common/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      constraints: const BoxConstraints.expand(),
      child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          color: Colors.white,
          margin: EdgeInsets.zero,
          elevation: 0,
          child: ListView(
            children: [
              _item('これはタイトル', Icons.title),
              _item('', Icons.title),
              _item('', Icons.title),
              _item('', Icons.title),
            ],
          )),
    );
  }
}

Widget _item(String title, IconData icon) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
    child: ListTile(
      leading: Icon(icon),
      title: Text(
        title,
      ),
    ),
  );
}
