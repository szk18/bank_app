import 'dart:async';

import 'package:bank_app/helper/navigation_helper.dart';

import 'package:bank_app/model/user.dart';
import 'package:bank_app/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class AuthViewModel extends ChangeNotifier {
  User _authUser;

  User get authUser => _authUser;

  Future<void> login(String name, String email) async {
    _authUser = await AuthRepository().login(name, email);
    notifyListeners();
    navigationRootPage();
  }

  void logout() {
    print('logout');
    navigationLoginPage();
    _authUser = User(name: '', email: ''); // 空ユーザ入れとく
    notifyListeners();
  }

  void navigationLoginPage() {
    locator<NavigationHelper>().navigateTo('/login');
  }

  void navigationRootPage() {
    locator<NavigationHelper>().navigateTo('/root');
  }
}
