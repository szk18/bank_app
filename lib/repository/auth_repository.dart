import 'package:bank_app/models/user.dart';

class AuthRepository {
  Future<User> login() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return User(name: 'suzuki', email: 'example@example.com');
  }
}
