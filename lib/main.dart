import 'package:bank_app/config/theme.dart';
import 'package:bank_app/helper/navigation_helper.dart';
import 'package:bank_app/model/navigation_model.dart';
import 'package:bank_app/view/page/login_page.dart';
import 'package:bank_app/view/page/root.dart';
import 'package:bank_app/viewmodel/auth_view_model.dart';
import 'package:bank_app/viewmodel/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationHelper());
}

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> _routes = {
    '/login': (context) => LoginPage(),
    '/root': (context) => Root(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      navigatorKey: locator<NavigationHelper>().navigatorKey,
      home: LoginPage(),
      routes: _routes,
    );
  }
}
