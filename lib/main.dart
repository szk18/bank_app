import 'package:bank_app/config/theme.dart';
import 'package:bank_app/model/navigation_model.dart';
import 'package:bank_app/view/page/login_page.dart';
import 'package:bank_app/view/page/root.dart';
import 'package:bank_app/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> _routes = {
    '/': (context) => LoginPage(),
    '/root': (context) => Root(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      routes: _routes,
    );
  }
}
