import 'package:flutter/material.dart';

class NavigationModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void update(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
