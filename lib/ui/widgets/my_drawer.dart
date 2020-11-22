import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final _listItems = ['FAQ', 'お知らせ', '設定', 'アプリについて'];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('account name'),
                accountEmail: Text('account email'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.credit_card_outlined),
                ),
                decoration: BoxDecoration(color: Colors.lightBlue)),
            Container(
              height: double.maxFinite, // 高さを指定する
              child: ListView.separated(
                  // dividerを入れる
                  padding: const EdgeInsets.all(8),
                  itemCount: _listItems.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Colors.white,
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        _listItems[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
