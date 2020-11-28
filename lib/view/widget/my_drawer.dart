import 'package:bank_app/view/widget/my_web_view.dart';
import 'package:bank_app/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                accountName: Text(context.watch<AuthViewModel>().authUser.name),
                accountEmail:
                    Text(context.watch<AuthViewModel>().authUser.email),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.credit_card_outlined),
                ),
                decoration: BoxDecoration(color: Colors.lightBlue)),
            SizedBox(
              height: double.maxFinite, // 高さを指定する
              child: ListView.separated(
                  // dividerを入れる
                  padding: const EdgeInsets.all(8),
                  itemCount: _listItems.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(color: Theme.of(context).dividerColor),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () => {
                        print('tapped! at $index'),
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => MyWebView(
                              title: _listItems[index],
                              url: 'https://google.com',
                            ),
                          ),
                        ),
                      },
                      title: Text(
                        _listItems[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_outlined,
                        color: Theme.of(context).iconTheme.color,
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
