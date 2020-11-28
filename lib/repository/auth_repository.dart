import 'package:bank_app/model/user.dart';

class AuthRepository {
  Future<User> login(String name, String email) async {
    // ログインする
    await Future<void>.delayed(const Duration(seconds: 3));
    return User(name: name, email: email);
  }
}
