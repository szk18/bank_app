import 'dart:async';

import 'package:bank_app/model/event.dart';
import 'package:bank_app/model/user.dart';
import 'package:bank_app/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  User _authUser;

  User get authUser => _authUser;

  final _authController = StreamController<Event>();

  StreamController<Event> get loginAction => _authController;

  Future<void> login(String name, String email) async {
    _authUser = await AuthRepository().login(name, email);
    notifyListeners();
    _authController.sink.add(Event());
  }

  @override
  void dispose() {
    _authController.close();
    super.dispose();
  }
}
