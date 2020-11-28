class NavigationModel {
  NavigationModel._internal();
  factory NavigationModel() => _instance;

  static final NavigationModel _instance = NavigationModel._internal();
  int currentIndex = 0;
}
