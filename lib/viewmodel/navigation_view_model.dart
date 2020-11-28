import 'package:bank_app/model/navigation_model.dart';
import 'package:flutter/cupertino.dart';

class NavigationViewModel extends ChangeNotifier {
  NavigationViewModel() : _navigationModel = NavigationModel();

  final NavigationModel _navigationModel;

  void update(int newIndex) {
    _navigationModel.currentIndex = newIndex;
    notifyListeners();
  }

  int currentIndex() => _navigationModel.currentIndex;
}
