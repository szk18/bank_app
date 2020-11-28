import 'package:bank_app/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController(text: '佐藤太郎');
  final _emailController = TextEditingController(text: 'example@example.com');

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    authViewModel.loginAction.stream.listen((_) {
      Navigator.of(context).pushReplacementNamed('/root');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // paddingを追加
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.face),
                  hintText: '佐藤太郎',
                  labelText: '名前',
                ),
                validator: (String value) {
                  return value.isEmpty ? '入力は必須です' : null;
                },
                controller: _userController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'example@example.com',
                  labelText: 'メールアドレス',
                ),
                validator: (String value) {
                  return value.isEmpty ? '入力は必須です' : null;
                },
                controller: _emailController,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print('loading...');
                    await context.read<AuthViewModel>().login();
                  }
                },
                child: const Text('login!'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
