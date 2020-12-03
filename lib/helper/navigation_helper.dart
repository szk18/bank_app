import 'package:flutter/material.dart';

class NavigationHelper {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateTo(String routeName) =>
      navigatorKey.currentState.pushNamed(routeName);

  void goBack() => navigatorKey.currentState.pop();
}
