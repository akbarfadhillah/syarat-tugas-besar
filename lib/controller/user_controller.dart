import 'package:appsi/data/user/user.dart';
import 'package:flutter/cupertino.dart';

class UserController extends ChangeNotifier {
  final MyUser _user = MyUser(
      userName: 'Mochammad Akbar F',
      jobTitle: 'Siswa',
      image: 'assets/images/1.jpg');

  bool _isLoggedIn = false;

  MyUser get profile => _user;
  bool get isLogin => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
